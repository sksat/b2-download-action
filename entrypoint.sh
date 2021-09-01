#!/bin/sh

set -eu

B2_KEY_ID="$1"
B2_KEY="$2"
B2_BUCKET="$3"

FILE_NAME="$4"
LOCAL_NAME="$5"

echo "authorize"
b2 authorize-account "${B2_KEY_ID}" "${B2_KEY}"

echo "download ${FILE_NAME} from ${B2_BUCKET} as ${LOCAL_NAME}"
b2 download-file-by-name "${B2_BUCKET}" "${FILE_NAME}" "${LOCAL_NAME}"

b2 clear-account
