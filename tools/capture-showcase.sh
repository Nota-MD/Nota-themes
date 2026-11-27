#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
nota_root="${NOTA_ROOT:-$root/../Nota}"
nota_bin="${NOTA_BIN:-$nota_root/src-tauri/target/debug/nota}"
display="${NOTA_CAPTURE_DISPLAY:-:92}"
sample="$root/docs/showcase.md"
ui_out="$root/docs/images/ui"
doc_out="$root/docs/images/document"
temp_root="$(mktemp -d "${TMPDIR:-/tmp}/nota-theme-capture.XXXXXX")"
ui_config="$temp_root/ui-config"
doc_config="$temp_root/doc-config"
runtime_dir="$temp_root/runtime"
xvfb_pid=""
app_pid=""

cleanup() {
  if [ -n "$app_pid" ]; then
    kill "$app_pid" 2>/dev/null || true
    wait "$app_pid" 2>/dev/null || true
  fi
  if [ -n "$xvfb_pid" ]; then
    kill "$xvfb_pid" 2>/dev/null || true
    wait "$xvfb_pid" 2>/dev/null || true
  fi
  rm -rf "$temp_root"
}
trap cleanup EXIT INT TERM

command -v Xvfb >/dev/null
command -v xdotool >/dev/null
command -v import >/dev/null

if [ ! -x "$nota_bin" ]; then
  echo "Nota binary not found: $nota_bin" >&2
  exit 1
fi
if ! curl -fsS "http://localhost:5273" >/dev/null; then
  echo "The Nota Vite development server is not running on port 5273." >&2
  exit 1
fi

mkdir -p "$ui_out" "$doc_out"
mkdir -p "$ui_config/nota/themes/ui" "$doc_config/nota/themes" "$runtime_dir"
chmod 700 "$runtime_dir"
cp -a "$root/ui/." "$ui_config/nota/themes/ui/"
cp -a "$root/document/." "$doc_config/nota/themes/"

write_ui_settings() {
  local theme="$1"
  local mode="$2"
  local document_theme
  case "$theme" in
    adwaita|yaru) document_theme="adwaita" ;;
    ghub) document_theme="github" ;;
    carbon) document_theme="ibm-documentation" ;;
    cde) document_theme="cde" ;;
    cde-solaris) document_theme="cde-solaris" ;;
    plasma|macos|windows|windows10) document_theme="minimal" ;;
  esac
  if [ "$mode" = "dark" ] && [ "$document_theme" != "cde" ] &&
    [ "$document_theme" != "cde-solaris" ] &&
    [ "$document_theme" != "ibm-documentation" ]; then
    document_theme="$document_theme-dark"
  fi
  cat > "$ui_config/nota/settings.toml" <<EOF
ui_style = "$theme"
ui_mode = "$mode"
document_theme = "$document_theme"
ui_font_size = 14
content_width = 760
limit_text_width = false
confirm_unsaved = true
autosave_seconds = 0
strict_markdown = false
enable_physics = false

[appearance]
toolbar = "always"
show_status_bar = true
show_menu_bar = true
settings_window_style = "embedded"

[general]
onboarding_seen = true
EOF
}

write_doc_settings() {
  local theme="$1"
  cat > "$doc_config/nota/settings.toml" <<EOF
ui_style = "adwaita"
ui_mode = "light"
document_theme = "$theme"
ui_font_size = 14
content_width = 760
limit_text_width = false
confirm_unsaved = true
autosave_seconds = 0
strict_markdown = false
enable_physics = false

[appearance]
toolbar = "never"
show_status_bar = true
show_menu_bar = true
settings_window_style = "embedded"

[general]
onboarding_seen = true
EOF
}

wait_for_display() {
  for _ in $(seq 1 50); do
    if DISPLAY="$display" xdotool getdisplaygeometry >/dev/null 2>&1; then
      return
    fi
    sleep 0.1
  done
  echo "Xvfb did not become ready on $display" >&2
  exit 1
}

capture() {
  local config="$1"
  local output="$2"

  DISPLAY="$display" \
    GDK_BACKEND=x11 \
    XDG_CONFIG_HOME="$config" \
    XDG_RUNTIME_DIR="$runtime_dir" \
    NO_AT_BRIDGE=1 \
    WEBKIT_DISABLE_COMPOSITING_MODE=1 \
    "$nota_bin" --new-window "$sample" \
    >"$temp_root/nota.log" 2>&1 &
  app_pid=$!

  local window=""
  for _ in $(seq 1 100); do
    window="$(DISPLAY="$display" xdotool search --onlyvisible --class nota 2>/dev/null | head -1 || true)"
    if [ -n "$window" ]; then
      break
    fi
    sleep 0.1
  done
  if [ -z "$window" ]; then
    echo "Nota window did not appear for $output" >&2
    cat "$temp_root/nota.log" >&2
    exit 1
  fi

  DISPLAY="$display" xdotool windowmove "$window" 0 0
  DISPLAY="$display" xdotool windowsize "$window" 1400 900
  sleep 2
  DISPLAY="$display" import -window root "$output"
  kill "$app_pid" 2>/dev/null || true
  wait "$app_pid" 2>/dev/null || true
  app_pid=""
}

Xvfb "$display" -screen 0 1400x900x24 >"$temp_root/xvfb.log" 2>&1 &
xvfb_pid=$!
wait_for_display

for theme in adwaita ghub plasma macos windows windows10 yaru carbon cde cde-solaris; do
  echo "Capturing interface theme: $theme (light)"
  write_ui_settings "$theme" light
  capture "$ui_config" "$ui_out/$theme.png"
  echo "Capturing interface theme: $theme (dark)"
  write_ui_settings "$theme" dark
  capture "$ui_config" "$ui_out/$theme-dark.png"
done

for theme in adwaita adwaita-dark minimal minimal-dark latex latex-dark cde cde-solaris vellum github github-dark ibm-documentation; do
  echo "Capturing document theme: $theme"
  write_doc_settings "$theme"
  capture "$doc_config" "$doc_out/$theme.png"
done

echo "Theme screenshots updated under docs/images/ui and docs/images/document."
