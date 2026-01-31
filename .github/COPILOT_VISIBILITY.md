# How to Hide Visibility of PR or Copilot

This document explains how to hide or control the visibility of Pull Requests (PR) and GitHub Copilot in this repository.

## Hiding GitHub Copilot Suggestions

### Option 1: Disable Copilot for Specific Files
Add patterns to `.gitattributes` to mark files as generated:
```
*.generated.* linguist-generated=true
```

### Option 2: Disable Copilot at Repository Level
1. Go to Repository Settings
2. Navigate to "Code security and analysis"
3. Under "GitHub Copilot", click "Disable"

### Option 3: Disable Copilot in Your IDE
- **VS Code**: Open Settings → Search for "Copilot" → Disable "GitHub Copilot"
- **JetBrains**: Settings → Tools → GitHub Copilot → Disable

## Hiding PR Elements

### Hide Files from PR Diffs
Mark files as generated in `.gitattributes`:
```
path/to/file linguist-generated=true
```

### Hide Automated Checks
Configure in `.github/settings.yml` to control which checks appear on PRs.

### Hide PR Comments
1. Go to PR conversation tab
2. Click "..." on any comment
3. Select "Hide" or "Minimize"

## Repository Settings

This repository includes:
- `.gitattributes` - Controls diff visibility
- `.github/settings.yml` - Repository configuration (requires probot/settings app)

## Additional Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Git Attributes Documentation](https://git-scm.com/docs/gitattributes)
- [GitHub PR Documentation](https://docs.github.com/en/pull-requests)
