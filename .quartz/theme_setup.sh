#!/bin/bash

# Only print echos
set +x

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'

echo_err() { echo -e "${RED}$1${NC}"; }
echo_warn() { echo -e "${YELLOW}$1${NC}"; }
echo_ok() { echo -e "${GREEN}$1${NC}"; }
echo_info() { echo -e "${BLUE}$1${NC}"; }

THEME_DIR="themes"
QUARTZ_STYLES_DIR="quartz/styles"
FINAL_THEME_DIR="./$QUARTZ_STYLES_DIR/$THEME_DIR"

if [ -f "./$QUARTZ_STYLES_DIR/custom.scss" ]; then
  echo_ok "Quartz root succesfully detected..."
  FINAL_THEME_DIR="./$QUARTZ_STYLES_DIR/$THEME_DIR"
else
  echo_warn "Quartz root not detected, checking if we are in the styles directory..."
  if [ -f "./custom.scss" ]; then
    echo_ok "Styles directory detected..."
    FINAL_THEME_DIR="./$THEME_DIR"
  else
    echo_err "Cannot detect Quartz repository. Are you in the correct working directory?" 1>&2
    exit 1
  fi
fi

echo "Cleaning theme directory..."

rm -rf ${FINAL_THEME_DIR}

echo "Creating theme directory..."

mkdir -p ${FINAL_THEME_DIR}

echo "Installing theme files..."

mv digital-garden/.quartz/_index.scss quartz/styles/themes/_index.scss

echo "Applying patches..."

if grep -q -e "quartz themes dark-only" -e "quartz themes light-only" "$FINAL_THEME_DIR/_index.scss"; then
  echo_warn "Single mode theme detected, applying patch..."
  sed -i "/Component\.Darkmode\(\)/d" "quartz.layout.ts"
fi

echo "Verifying setup..."

cd ${FINAL_THEME_DIR}

if grep -q '^@use "./themes";' "../custom.scss"; then
  # Import already present in custom.scss
  echo_warn "Theme import line already present in custom.scss. Skipping..."
else
  # Add `@use "./themes";` import to custom.scss
  sed -ir 's#@use "./base.scss";#@use "./base.scss";\n@use "./themes";#' "../custom.scss"
  echo_info "Added import line to custom.scss..."
fi

echo_ok "Finished fetching and applying theme '${THEME}'."