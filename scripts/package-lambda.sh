#!/bin/bash
set -e

echo "Packaging Lambda function..."

# Move to project root
cd "$(git rev-parse --show-toplevel)"

# Define paths
LAMBDA_SRC="lambda/visitor-counter/index.mjs"
ZIP_DIR="terraform/lambda"
ZIP_PATH="$ZIP_DIR/visitor-counter.zip"
TEMP_DIR="terraform/lambda-temp"

# Ensure lambda source exists
if [ ! -f "$LAMBDA_SRC" ]; then
  echo " Lambda source file not found: $LAMBDA_SRC"
  exit 1
fi

# Clean old artifacts
rm -f "$ZIP_PATH"
rm -rf "$TEMP_DIR"

# Create temp and copy lambda source
mkdir -p "$TEMP_DIR"
cp "$LAMBDA_SRC" "$TEMP_DIR/index.mjs"

# Zip
cd "$TEMP_DIR"
zip -r "../lambda/visitor-counter.zip" .

# Cleanup
cd ..
rm -rf "$TEMP_DIR"

echo " Lambda packaged at $ZIP_PATH"
