#!/usr/bin/env bash
# Verify that font-bearing theme packages are self-contained and legally complete.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
need() {
  if [ ! -s "$1" ]; then
    echo "FAIL missing or empty: $1" >&2
    fail=1
  fi
}

for f in \
  ui/yaru/assets/fonts/Ubuntu-Regular.ttf \
  ui/yaru/assets/fonts/UbuntuMono-Regular.ttf \
  ui/yaru/assets/fonts/UBUNTU-FONT-LICENCE-1.0.txt \
  ui/adwaita/assets/fonts/AdwaitaSans-Regular.ttf \
  ui/adwaita/assets/fonts/AdwaitaMono-Regular.ttf \
  ui/adwaita/assets/fonts/LICENSE.txt \
  ui/carbon/assets/fonts/IBMPlexSansSC-Regular.woff2 \
  ui/carbon/assets/fonts/IBMPlexMono-Regular.woff2 \
  ui/carbon/assets/fonts/IBM-PLEX-SANS-SC-OFL-1.1.txt \
  ui/carbon/assets/fonts/IBM-PLEX-MONO-OFL-1.1.txt \
  ui/cde/assets/fonts/Nota-WenQuanYi-Bitmap-Song-EBDT-16px.woff2 \
  ui/cde/assets/fonts/WQY-Bitmap-Song-COPYRIGHT.txt \
  ui/cde/assets/fonts/GPL-2.0.txt \
  ui/cde-solaris/assets/fonts/Nota-WenQuanYi-Bitmap-Song-EBDT-16px.woff2 \
  ui/cde-solaris/assets/fonts/WQY-Bitmap-Song-COPYRIGHT.txt \
  ui/cde-solaris/assets/fonts/GPL-2.0.txt \
  document/latex/assets/fonts/NewCM10-Book.otf \
  document/latex/assets/fonts/NewCMMono10-Book.otf \
  document/latex/assets/fonts/NEW-CM-GUST-FONT-LICENSE.md \
  document/latex-dark/assets/fonts/NewCM10-Book.otf \
  document/vellum/assets/fonts/SpecialElite-Regular.woff2 \
  document/vellum/assets/fonts/SPECIAL-ELITE-APACHE-2.0.txt \
  document/vellum/assets/fonts/Huiwen-MinchoGBK-Latin.woff2 \
  document/vellum/assets/fonts/Huiwen-MinchoGBK-5000.woff2 \
  document/vellum/assets/fonts/Huiwen-MinchoGBK-9800.woff2 \
  document/vellum/assets/fonts/Huiwen-MinchoGBK-CJK-5.woff2 \
  document/vellum/assets/fonts/HUIWEN-MINCHO-NOTICE.txt \
  document/vellum/assets/fonts/FONT-SHA256SUMS.txt; do
  need "$f"
done

grep -q '@font-face' ui/yaru/theme.css || { echo "FAIL Yaru has no @font-face" >&2; fail=1; }
grep -q '@font-face' ui/adwaita/theme.css || { echo "FAIL Adwaita has no @font-face" >&2; fail=1; }
grep -q '@font-face' ui/carbon/theme.css || { echo "FAIL Carbon has no @font-face" >&2; fail=1; }
grep -q '@font-face' document/latex/theme.css || { echo "FAIL LaTeX has no @font-face" >&2; fail=1; }
grep -q '@font-face' document/latex-dark/theme.css || { echo "FAIL LaTeX Dark has no @font-face" >&2; fail=1; }
grep -q '@font-face' document/vellum/theme.css || { echo "FAIL Vellum has no @font-face" >&2; fail=1; }
grep -q 'unicode-range' document/vellum/theme.css || { echo "FAIL Vellum Mincho is not split by unicode-range" >&2; fail=1; }

while IFS= read -r file; do
  size=$(stat -c%s "$file")
  if [ "$size" -gt $((8 * 1024 * 1024)) ]; then
    echo "FAIL asset exceeds Nota's 8 MiB limit: $file ($size bytes)" >&2
    fail=1
  fi
done < <(find document/vellum/assets/fonts -type f -name '*.woff2')

total=$(find document/vellum/assets/fonts -type f -name '*.woff2' -printf '%s\n' \
  | awk '{ sum += $1 } END { print sum + 0 }')
if [ "$total" -gt $((24 * 1024 * 1024)) ]; then
  echo "FAIL Vellum font assets exceed Nota's 24 MiB total limit: $total bytes" >&2
  fail=1
fi

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "OK: bundled theme fonts and licences are complete"
