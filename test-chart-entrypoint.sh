#!/usr/bin/env bash

git clone "${SBO_REPO}" ${SBO_DIR}
git checkout "${SBO_REPO_COMMIT}"
mkdir -p ${SBO_DIR}/out
echo $TEST_NAMESPACE> ${SBO_DIR}/out/test-namespace
make -o test-cleanup -o create-test-namespace test-acceptance 