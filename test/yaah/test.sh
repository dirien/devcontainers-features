#!/bin/bash
set -e

source dev-container-features-test-lib

check "yaah is installed" which yaah
check "yaah version runs" yaah version
check "yaah help runs" yaah --help

reportResults
