#!/bin/bash
set -e

source dev-container-features-test-lib

check "yaah is installed" which yaah
check "yaah version is 0.2.0" bash -c "yaah version | grep '0.2.0'"

reportResults
