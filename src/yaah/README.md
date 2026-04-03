
# yaah (yaah)

Installs yaah (Yet Another Agent Harness) CLI from GitHub Releases

## Example Usage

```json
"features": {
    "ghcr.io/dirien/devcontainer-features/yaah:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of yaah to install (e.g., 0.3.3). Set to 'latest' to fetch the latest version from GitHub. | string | latest |
| agent | Agent profile to generate config for (e.g., claude, copilot, opencode, codex). Leave empty to skip generation. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/dirien/devcontainer-features/blob/main/src/yaah/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
