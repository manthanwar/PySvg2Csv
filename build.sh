#!/bin/bash
# ==============================================================================
# File Name     : buildDist.sh
# Date Created  : 2025-09-25 17:40 UTC +02:00
# description   : buildDist script
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
# Usage: ./scripts/buildDist
# other arg $1 options: cleanDist|cleanDistBuildDist|uploadTest|upload
# ==============================================================================

SCRIPT_DIR=$(dirname -- "$0")
ABSOLUTE_SCRIPT_DIR=$(pwd)

echo "Running script $0"

echo "Script directory: $SCRIPT_DIR"

echo "Absolute script directory: $ABSOLUTE_SCRIPT_DIR"


function buildDist() {
echo "Building dist..."
python -m buildDist
}

function cleanDist() {
echo "Removing dist..."
rm -rf dist/
}

function testpypi() {
echo "Uploading to testpypi..."
twine upload --repository testpypi dist/
}

function pypi() {
echo "Uploading to pypi..."
twine upload --repository pypi dist/
}

# Check if the first argument is empty
# if [[ -z "$1" ]]; then
#   buildDist
# fi

if [[ "$1" == "clean" ]]; then
  cleanDist
  ls --group-directories-first --color=auto
fi

if [[ "$1" == "cleanBuild" ]]; then
  cleanDist
  buildDist
fi

if [[ "$1" == "uploadtest" ]]; then
  cleanDist && buildDist && testpypi
fi

if [[ "$1" == "upload" ]]; then
  cleanDist
  buildDist
  pypi
fi