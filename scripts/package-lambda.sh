#!/bin/bash
set -e

echo "Packaging Lambda function..."

# Go to the repo root directory (safe regardless of where script is called from)
cd "$(git rev-parse --show-toplevel)"

# Prepare temp folder
mkdir -p terraform/lambda-temp

# Copy Lambda code
cp lambda/visitor-counter/index.mjs terraform/lambda-temp/index.mjs

# Zip it
cd terraform/lambda-temp
zip -r ../lambda/visitor-counter.zip .

# Cleanup
cd ..
rm -rf lambda-temp

echo " Lambda function zipped at terraform/lambda/visitor-counter.zip"
