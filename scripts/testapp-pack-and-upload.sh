#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
ARCHIVE_NAME="testapp-$(date +%s).tar.gz"
ARCHIVE_S3_URI="s3://turtle-v2-test-fixtures/$ARCHIVE_NAME"

git archive --format=tar.gz --prefix project/ -o $ARCHIVE_NAME HEAD $SCRIPT_DIR/..
aws s3 cp $ARCHIVE_NAME $ARCHIVE_S3_URI

rm -rf $ARCHIVE_NAME
