#!/usr/bin/env bash
#
# Verify that every native theme icon reference is package-local and present,
# and that each third-party icon package keeps its license. This runs offline.
set -euo pipefail

HERE="$(dirname "$(readlink -f "$0")")"
cd "$HERE/.."

failed=0
for theme in adwaita yaru plasma ghub windows windows10 macos; do
  css="ui/$theme/theme.css"
  icons="ui/$theme/assets/icons-theme"
  [ -d "$icons" ] || { echo "FAIL: $icons is missing" >&2; failed=1; continue; }

  while read -r icon; do
    [ -n "$icon" ] || continue
    [ -f "$icons/$icon" ] || {
      echo "FAIL: $theme references missing $icon" >&2
      failed=1
    }
  done < <(grep -oE 'url\("\./assets/icons-theme/[^"]+"\)' "$css" \
    | sed 's#^url("./assets/icons-theme/##; s#")$##' \
    | sort -u)

  case "$theme" in
    adwaita|yaru|plasma|macos)
      compgen -G "$icons/LICENSE-*" >/dev/null || {
        echo "FAIL: $theme is missing its native icon licenses" >&2
        failed=1
      }
      ;;
    ghub|windows|windows10)
      [ -f "$icons/LICENSE-MIT.txt" ] || {
        echo "FAIL: $theme is missing its MIT icon license" >&2
        failed=1
      }
      ;;
  esac

  ( cd "$icons" && sha256sum -c SHA256SUMS --quiet ) || failed=1
done

[ "$failed" = 0 ] || exit 1
echo "OK: theme image references, licenses, and checksums are complete"
