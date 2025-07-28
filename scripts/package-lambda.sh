#!/bin/bash
set -e

echo "📦 Packaging Lambda function..."

# Go to project root (from terraform folder)
cd ..

# Create temp folder
mkdir -p terraform/lambda-temp

# Copy the Lambda source to temp folder
cp lambda/visitor-counter/index.mjs terraform/lambda-temp/index.mjs

# Zip the contents
cd terraform/lambda-temp
zip -r ../lambda/visitor-counter.zip .

# Cleanup temp
cd ..
rm -rf lambda-temp

echo "✅ Lambda function zipped at terraform/lambda/visitor-counter.zip"
