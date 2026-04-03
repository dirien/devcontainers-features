#!/bin/sh
set -e

VERSION="${VERSION:-"latest"}"
AGENT="${AGENT:-""}"
GITHUB_REPO="dirien/yet-another-agent-harness"
INSTALL_DIR="/usr/local/bin"

# Determine OS
detect_os() {
    local os
    os="$(uname -s)"
    case "${os}" in
        Linux)  echo "linux" ;;
        Darwin) echo "darwin" ;;
        *)      echo "Unsupported OS: ${os}" >&2; exit 1 ;;
    esac
}

# Determine architecture
detect_arch() {
    local arch
    arch="$(uname -m)"
    case "${arch}" in
        x86_64|amd64)   echo "amd64" ;;
        aarch64|arm64)   echo "arm64" ;;
        *)               echo "Unsupported architecture: ${arch}" >&2; exit 1 ;;
    esac
}

# Resolve "latest" to an actual version tag via redirect header (no API rate limits)
resolve_version() {
    local version="$1"
    if [ "${version}" = "latest" ]; then
        local redirect_url
        redirect_url="$(curl -sI "https://github.com/${GITHUB_REPO}/releases/latest" \
            | grep -i "^location:" \
            | tr -d '\r' \
            | awk '{print $2}')"
        version="${redirect_url##*/}"
    fi
    # Strip leading 'v' if present for asset naming consistency
    version="${version#v}"
    echo "${version}"
}

echo "Installing yaah..."

OS="$(detect_os)"
ARCH="$(detect_arch)"
VERSION="$(resolve_version "${VERSION}")"

echo "  Version: ${VERSION}"
echo "  OS:      ${OS}"
echo "  Arch:    ${ARCH}"

ASSET_NAME="yet-another-agent-harness_${OS}_${ARCH}.tar.gz"
DOWNLOAD_URL="https://github.com/${GITHUB_REPO}/releases/download/v${VERSION}/${ASSET_NAME}"

echo "  Downloading from: ${DOWNLOAD_URL}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

curl -fsSL "${DOWNLOAD_URL}" -o "${TMP_DIR}/${ASSET_NAME}"
tar -xzf "${TMP_DIR}/${ASSET_NAME}" -C "${TMP_DIR}"

install -m 0755 "${TMP_DIR}/yaah" "${INSTALL_DIR}/yaah"

echo "yaah ${VERSION} installed to ${INSTALL_DIR}/yaah"

# Generate agent config if agent is specified
if [ -n "${AGENT}" ]; then
    echo "Generating config for agent: ${AGENT}"
    su - "$_REMOTE_USER" -c "yaah generate -a ${AGENT}"
fi
