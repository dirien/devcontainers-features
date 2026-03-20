# yaah (Yet Another Agent Harness)

Installs the [yaah](https://github.com/dirien/yet-another-agent-harness) CLI binary from GitHub Releases.

## Example Usage

```json
"features": {
    "ghcr.io/dirien/devcontainer-features/yaah:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of yaah to install. Use 'latest' for the most recent release, or specify a version like '0.1.8'. | string | latest |

## OS Support

This feature installs a statically linked binary and supports **linux** and **darwin** on **amd64** and **arm64** architectures.
