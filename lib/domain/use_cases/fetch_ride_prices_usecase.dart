import 'package:sasta_taxi/data/models/comparison_result_model.dart';
import 'package:sasta_taxi/data/repositories/ride_comparison_repository.dart';

/// Use case for fetching ride prices
class FetchRidePricesUseCase {
  final RideComparisonRepository _repository;
  
  FetchRidePricesUseCase(this._repository);
  
  Future<ComparisonResultModel> execute({
    required String source,
    required String destination,
    required String city,
  }) async {
    if (source.isEmpty || destination.isEmpty || city.isEmpty) {
      throw ArgumentError('Source, destination, and city cannot be empty');
    }
    
    return await _repository.fetchRidePrices(
      source: source,
      destination: destination,
      city: city,
    );
  }
}
