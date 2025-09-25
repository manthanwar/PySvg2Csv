#!/bin/bash
# ==============================================================================
# File Name     : build.sh
# Date Created  : 2025-09-25 18:26 UTC +02:00
# description   : Build Script
# ------------------------------------------------------------------------------
# Author        : Amit Manohar Manthanwar
# Mailer        : manthanwar@hotmail.com
# WebURL        : https:#manthanwar.github.io
# ------------------------------------------------------------------------------
# Copyright     : (c) 2025 Amit Manohar Manthanwar
# License       : LICENSE.md
# ==============================================================================
# Revision Log  | Author  | Description
# --------------+---------+-----------------------------------------------------
# 25-Sep-2025   | AMM     | Initial Version
# --------------+---------+-----------------------------------------------------
# Usage: ./scripts/build.sh cleanTest
# arg $1 options: none|clean|cleanBuild|test|upload
# ==============================================================================

PROJECT_ROOT=$(git rev-parse --show-toplevel)
# SCRIPT_DIR=$(dirname -- "$0")
# ABSOLUTE_SCRIPT_DIR=$(pwd)

echo "Running script $0"
echo "Project root: $PROJECT_ROOT"
# echo "Script directory: $ABSOLUTE_SCRIPT_DIR"
# echo "Absolute script directory: $ABSOLUTE_SCRIPT_DIR"

function buildDist() {
echo "Building dist..."
python -m build
}

function cleanDist() {
echo "Removing dist..."
rm -rf dist/
}

function UploadTestPypi() {
echo "Uploading to testpypi..."
twine upload --non-interactive --repository testpypi dist/*
}

function UploadPypi() {
echo "Uploading to pypi..."
twine upload --repository pypi dist/*
}


# Check if the first argument is empty
if [[ -z "$1" ]]; then
  buildDist
fi

if [[ "$1" == "clean" ]]; then
  cleanDist
  ls --group-directories-first --color=auto
fi

if [[ "$1" == "cleanBuild" ]]; then
  cleanDist
  buildDist
fi

# if [[ "$1" == "test" ]]; then
#   UploadTestPypi
# fi

if [[ "$1" == "test" ]]; then
  cleanDist
  buildDist
  UploadTestPypi
fi

# if [[ "$1" == "upload" ]]; then
#   UploadPypi
# fi

if [[ "$1" == "upload" ]]; then
  cleanDist
  buildDist
  UploadPypi
fi