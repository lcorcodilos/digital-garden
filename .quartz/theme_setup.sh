if grep -q '^@use "./themes";' "quartz/styles/custom.scss"; then
  # Import already present in custom.scss
  echo_warn "Theme import line already present in custom.scss. Skipping..."
else
  # Add `@use "./themes";` import to custom.scss
  sed -ir 's#@use "./base.scss";#@use "./base.scss";\n@use "./themes";#' "quartz/styles/custom.scss"
  echo_info "Added import line to custom.scss..."
fi
