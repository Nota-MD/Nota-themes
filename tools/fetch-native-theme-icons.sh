#!/usr/bin/env bash
#
# Fetch the theme-native icons used by Adwaita, Yaru, and Breeze.
# Repositories and commits are pinned so the checked-in output is auditable.
set -euo pipefail

HERE="$(dirname "$(readlink -f "$0")")"
cd "$HERE/.."

OUT="src/assets/theme-icons"
ADWAITA_COMMIT="2066120e58cf17939ac337dccfc1b67047dd19e3"
YARU_COMMIT="7f18973e05607c609c4b972f0dd9bff36fa2a13e"
BREEZE_COMMIT="3183b090219bf48b116fa3e4c82380d34b860218"

ADWAITA_BASE="https://raw.githubusercontent.com/GNOME/adwaita-icon-theme/$ADWAITA_COMMIT"
YARU_BASE="https://raw.githubusercontent.com/ubuntu/yaru/$YARU_COMMIT"
BREEZE_BASE="https://raw.githubusercontent.com/KDE/breeze-icons/$BREEZE_COMMIT"

MAP=$(cat <<'EOF'
adwaita document-open Adwaita/symbolic/actions/document-open-symbolic.svg
adwaita document-new Adwaita/symbolic/actions/document-new-symbolic.svg
adwaita document-save Adwaita/symbolic/actions/document-save-symbolic.svg
adwaita document-save-as Adwaita/symbolic/actions/document-save-as-symbolic.svg
adwaita document-export Adwaita/symbolic/actions/document-send-symbolic.svg
adwaita close Adwaita/symbolic/ui/window-close-symbolic.svg
adwaita configure Adwaita/symbolic/categories/preferences-system-symbolic.svg
adwaita plugin Adwaita/symbolic/mimetypes/application-x-addon-symbolic.svg
adwaita window Adwaita/symbolic/devices/video-display-symbolic.svg
adwaita columns Adwaita/symbolic/actions/view-dual-symbolic.svg
adwaita image Adwaita/symbolic/actions/insert-image-symbolic.svg
adwaita code Adwaita/symbolic/legacy/utilities-terminal-symbolic.svg
adwaita code-block Adwaita/symbolic/legacy/utilities-terminal-symbolic.svg
adwaita link Adwaita/symbolic/actions/insert-link-symbolic.svg
adwaita find Adwaita/symbolic/actions/edit-find-symbolic.svg
adwaita find-replace Adwaita/symbolic/actions/edit-find-replace-symbolic.svg
adwaita copy Adwaita/symbolic/actions/edit-copy-symbolic.svg
adwaita paste Adwaita/symbolic/actions/edit-paste-symbolic.svg
adwaita delete Adwaita/symbolic/actions/edit-delete-symbolic.svg
adwaita bold Adwaita/symbolic/actions/format-text-bold-symbolic.svg
adwaita italic Adwaita/symbolic/actions/format-text-italic-symbolic.svg
adwaita underline Adwaita/symbolic/actions/format-text-underline-symbolic.svg
adwaita strike Adwaita/symbolic/actions/format-text-strikethrough-symbolic.svg
adwaita list-bullet Adwaita/symbolic/actions/view-list-bullet-symbolic.svg
adwaita list-ordered Adwaita/symbolic/actions/view-list-ordered-symbolic.svg
adwaita more Adwaita/symbolic/actions/view-more-horizontal-symbolic.svg
adwaita task Adwaita/symbolic/ui/checkbox-checked-symbolic.svg
adwaita sidebar-toggle Adwaita/symbolic/actions/sidebar-show-symbolic.svg
adwaita file Adwaita/symbolic/mimetypes/text-x-generic-symbolic.svg
adwaita folder Adwaita/symbolic/places/folder-symbolic.svg
adwaita folder-open Adwaita/symbolic/status/folder-open-symbolic.svg
adwaita spellcheck Adwaita/symbolic/actions/tools-check-spelling-symbolic.svg
adwaita doc-theme Adwaita/symbolic/mimetypes/font-x-generic-symbolic.svg
adwaita keys Adwaita/symbolic/devices/input-keyboard-symbolic.svg
adwaita update Adwaita/symbolic/actions/view-refresh-symbolic.svg
yaru document-open icons/Yaru/scalable/actions/document-open-symbolic.svg
yaru document-new icons/Yaru/scalable/actions/document-new-symbolic.svg
yaru document-save icons/Yaru/scalable/actions/document-save-symbolic.svg
yaru document-save-as icons/Yaru/scalable/actions/document-save-as-symbolic.svg
yaru document-export icons/Yaru/scalable/actions/document-send-symbolic.svg
yaru close icons/Yaru/scalable/ui/window-close-symbolic.svg
yaru configure icons/Yaru/scalable/apps/preferences-system-symbolic.svg
yaru plugin icons/Yaru/scalable/apps/extensions-symbolic.svg
yaru window icons/Yaru/scalable/devices/video-display-symbolic.svg
yaru columns icons/Yaru/scalable/actions/view-dual-symbolic.svg
yaru image icons/Yaru/scalable/actions/insert-image-symbolic.svg
yaru code icons/Yaru/scalable/apps/utilities-terminal-symbolic.svg
yaru code-block icons/Yaru/scalable/apps/utilities-terminal-symbolic.svg
yaru link icons/Yaru/scalable/actions/insert-link-symbolic.svg
yaru find icons/Yaru/scalable/actions/edit-find-symbolic.svg
yaru find-replace icons/Yaru/scalable/actions/edit-find-replace-symbolic.svg
yaru copy icons/Yaru/scalable/actions/edit-copy-symbolic.svg
yaru paste icons/Yaru/scalable/actions/edit-paste-symbolic.svg
yaru delete icons/Yaru/scalable/actions/edit-delete-symbolic.svg
yaru bold icons/Yaru/scalable/actions/format-text-bold-symbolic.svg
yaru italic icons/Yaru/scalable/actions/format-text-italic-symbolic.svg
yaru underline icons/Yaru/scalable/actions/format-text-underline-symbolic.svg
yaru strike icons/Yaru/scalable/actions/format-text-strikethrough-symbolic.svg
yaru highlight icons/Yaru/scalable/actions/text-highlight-symbolic.svg
yaru list-bullet icons/Yaru/scalable/actions/view-list-bullet-symbolic.svg
yaru list-ordered icons/Yaru/scalable/actions/view-list-ordered-symbolic.svg
yaru more icons/Yaru/scalable/actions/view-more-horizontal-symbolic.svg
yaru task icons/Yaru/scalable/actions/view-tasks-all-symbolic.svg
yaru sidebar-collapse icons/Yaru/scalable/actions/sidebar-hide-symbolic.svg
yaru sidebar-toggle icons/Yaru/scalable/actions/sidebar-show-symbolic.svg
yaru file icons/Yaru/scalable/mimetypes/text-x-generic-symbolic.svg
yaru folder icons/Yaru/scalable/places/folder-symbolic.svg
yaru folder-open icons/Yaru/scalable/status/folder-open-symbolic.svg
yaru focus icons/Yaru/scalable/time/timer-symbolic.svg
yaru doc-theme icons/Yaru/scalable/mimetypes/font-x-generic-symbolic.svg
yaru keys icons/Yaru/scalable/devices/input-keyboard-symbolic.svg
yaru update icons/Yaru/scalable/actions/view-refresh-symbolic.svg
yaru spellcheck icons/Yaru/scalable/actions/tools-check-spelling-symbolic.svg
breeze document-open icons/actions/16/document-open-symbolic.svg
breeze document-new icons/actions/16/document-new-symbolic.svg
breeze document-save icons/actions/16/document-save-symbolic.svg
breeze document-save-as icons/actions/16/document-save-as-symbolic.svg
breeze document-export icons/actions/16/document-export-symbolic.svg
breeze close icons/actions/16/window-close-symbolic.svg
breeze configure icons/actions/16/configure-symbolic.svg
breeze plugin icons/actions/16/extension-symbolic.svg
breeze columns icons/actions/16/view-split-left-right-symbolic.svg
breeze image icons/actions/16/insert-image-symbolic.svg
breeze code icons/actions/16/format-text-code-symbolic.svg
breeze code-block icons/actions/16/code-block-symbolic.svg
breeze link icons/actions/16/insert-link-symbolic.svg
breeze find icons/actions/16/edit-find-symbolic.svg
breeze find-replace icons/actions/16/edit-find-replace-symbolic.svg
breeze copy icons/actions/16/edit-copy-symbolic.svg
breeze paste icons/actions/16/edit-paste-symbolic.svg
breeze delete icons/actions/16/edit-delete-symbolic.svg
breeze bold icons/actions/16/format-text-bold-symbolic.svg
breeze italic icons/actions/16/format-text-italic-symbolic.svg
breeze underline icons/actions/16/format-text-underline-symbolic.svg
breeze strike icons/actions/16/format-text-strikethrough-symbolic.svg
breeze superscript icons/actions/16/format-text-superscript-symbolic.svg
breeze subscript icons/actions/16/format-text-subscript-symbolic.svg
breeze list-bullet icons/actions/16/format-list-unordered-symbolic.svg
breeze list-ordered icons/actions/16/format-list-ordered-symbolic.svg
breeze more icons/actions/16/view-more-horizontal-symbolic.svg
breeze quote icons/actions/16/format-text-blockquote-symbolic.svg
breeze task icons/actions/16/view-tasks-all-symbolic.svg
breeze sidebar-collapse icons/actions/16/sidebar-collapse-symbolic.svg
breeze sidebar-toggle icons/actions/16/sidebar-expand-symbolic.svg
breeze file icons/mimetypes/16/text-x-generic.svg
breeze folder icons/places/16/folder-symbolic.svg
breeze folder-open icons/places/16/folder-open-symbolic.svg
breeze focus icons/actions/16/clock-symbolic.svg
breeze doc-theme icons/actions/16/draw-text-symbolic.svg
breeze keys icons/devices/16/input-keyboard-symbolic.svg
breeze update icons/actions/16/view-refresh-symbolic.svg
breeze spellcheck icons/actions/16/tools-check-spelling-symbolic.svg
EOF
)

fetch_one() {
  local theme="$1"
  local destination="$2"
  local source="$3"
  local base
  case "$theme" in
    adwaita) base="$ADWAITA_BASE" ;;
    yaru)
      base="$YARU_BASE"
      case "$source" in
        icons/Yaru/scalable/apps/preferences-system-symbolic.svg)
          source="icons/Yaru/scalable/apps/system-settings-symbolic.svg" ;;
        icons/Yaru/scalable/apps/utilities-terminal-symbolic.svg)
          source="icons/Yaru/scalable/apps/terminal-app-symbolic.svg" ;;
        icons/Yaru/scalable/actions/view-list-bullet-symbolic.svg)
          source="icons/Yaru/scalable/actions/view-list-symbolic.svg" ;;
        icons/Yaru/scalable/actions/view-list-ordered-symbolic.svg)
          source="icons/Yaru/scalable/actions/format-ordered-list-symbolic.svg" ;;
        icons/Yaru/scalable/actions/view-tasks-all-symbolic.svg)
          source="icons/Yaru/scalable/actions/view-grid-symbolic.svg" ;;
        icons/Yaru/scalable/places/folder-symbolic.svg)
          source="icons/Yaru/scalable/mimetypes/inode-directory-symbolic.svg" ;;
        icons/Yaru/scalable/time/timer-symbolic.svg)
          source="icons/Yaru/scalable/time/timer-short-symbolic.svg" ;;
      esac
      ;;
    breeze)
      base="$BREEZE_BASE"
      case "$source" in
        icons/actions/16/extension-symbolic.svg)
          source="icons/actions/16/plugins.svg" ;;
        icons/actions/16/format-list-unordered-symbolic.svg)
          source="icons/actions/16/view-media-playlist.svg" ;;
        icons/actions/16/view-tasks-all-symbolic.svg)
          source="icons/actions/16/view-list-details.svg" ;;
        icons/actions/16/clock-symbolic.svg)
          source="icons/actions/16/appointment-new.svg" ;;
        *-symbolic.svg)
          source="${source/-symbolic.svg/.svg}" ;;
      esac
      ;;
    *) return 1 ;;
  esac
  mkdir -p "$OUT/$theme"
  local file="$OUT/$theme/$destination.svg"
  curl -fsS --retry 3 --retry-delay 2 --max-time 30 -o "$file" "$base/$source"
  head -c 200 "$file" | grep -q "<svg"
}
export ADWAITA_BASE YARU_BASE BREEZE_BASE OUT
export -f fetch_one

printf '%s\n' "$MAP" | xargs -P 4 -n 3 bash -c 'fetch_one "$@"' _

mkdir -p "$OUT/licenses/adwaita" "$OUT/licenses/yaru" "$OUT/licenses/breeze"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/adwaita/COPYING" \
  "$ADWAITA_BASE/COPYING"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/adwaita/COPYING_LGPL" \
  "$ADWAITA_BASE/COPYING_LGPL"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/adwaita/COPYING_CCBYSA3" \
  "$ADWAITA_BASE/COPYING_CCBYSA3"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/yaru/COPYING" \
  "$YARU_BASE/icons/COPYING"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/yaru/COPYING.LGPL-3.0" \
  "$YARU_BASE/COPYING.LGPL-3.0"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/breeze/COPYING-ICONS" \
  "$BREEZE_BASE/COPYING-ICONS"
curl -fsS --retry 3 --max-time 30 -o "$OUT/licenses/breeze/COPYING.LIB" \
  "$BREEZE_BASE/COPYING.LIB"

for theme in adwaita yaru breeze; do
  directory="ui/$theme/assets/icons-theme"
  (
    cd "$directory"
    find . -type f ! -name SHA256SUMS -printf '%P\n' \
      | LC_ALL=C sort \
      | while read -r file; do sha256sum "$file"; done > SHA256SUMS
  )
done
