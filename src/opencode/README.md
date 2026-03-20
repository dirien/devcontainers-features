
# opencode (opencode)

Installs opencode by SST with API keys configuration

## Example Usage

```json
"features": {
    "ghcr.io/dirien/devcontainer-features/opencode:0": {}
}
```

## Options

| Option    | Type   | Default    | Description                                                                 |
|-----------|--------|------------|-----------------------------------------------------------------------------|
| `version` | string | `latest`   | Version of opencode to install (e.g., `1.2.27`). Set to `latest` to fetch the latest version from GitHub. |

### Pin a specific version

```json
"features": {
    "ghcr.io/dirien/devcontainer-features/opencode:0": {
        "version": "1.2.27"
    }
}
```

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/dirien/devcontainer-features/blob/main/src/opencode/devcontainer-feature.json). Add additional notes to a `NOTES.md`._
