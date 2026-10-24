# Figma UI kit analysis

Reviewed locally on 2026-10-24:

- `Adwaita Design Kit (Community).fig`
- `macOS 27 (Community) (Copy).fig`
- `KDE Plasma 6: UI Kit (Demo) (Community).fig`
- `Ubuntu UI (Community).fig`
- `Windows UI 2.6 (Community).fig`
- `FluentWinUI.fig`

The files were parsed as Figma Kiwi documents. This analysis records measured
tokens only. No Figma layer, bitmap, icon, font, or Apple design resource is
copied into Nota Themes.

## Adwaita

- Text: Cantarell for native controls, mostly 11-15px; Inter used in the kit
  presentation.
- Header buttons: 34px high, 6px radius.
- Header bar: 48px high.
- Window: 12px outer radius.
- Sidebar item: 42px high, 6px radius.
- Switch: 48×26px.
- Core palette: window `#fafafb`, sidebar `#ebebed`, accent `#3584e4`.

Applied to `ui/adwaita/theme.css`: 34px controls, 6px control radius, 48px
toolbar, 12px floating-surface radius, and a 48×26 switch.

## macOS

- Text: SF Pro, predominantly 10-15px.
- Standard push buttons: 22-28px high, 5-6px radius.
- Text fields: 22-28px high, 5px radius.
- Menu rows: 19-24px high; hover selection uses 5-8px radius.
- Toolbar/title bar: 38px.
- Window radius: 16px.

Applied to `ui/macos/theme.css`: 5px small radius and 6px standard control
radius. The existing 28px control height and 38px toolbar already match the
kit.

## KDE Plasma 6

- Text: Noto Sans 12-14px for native controls.
- Settings rows: commonly 26-32px high, 5px radius.
- Search field: 26-30px high.
- Accent: `#3daee9`.

Applied to `ui/plasma/theme.css`: 28px controls and 5px standard radius.

## Ubuntu / Yaru

- Text: Ubuntu Bold 18px in the supplied application composition.
- Accent: `#e95420`.
- Application window radius: 8px.

Applied to `ui/yaru/theme.css`: 8px radius for larger floating surfaces while
retaining 4px compact controls.

## Windows 11 / Fluent

- Text: Segoe UI at 12-14px; semibold 14px for labels.
- Controls: 32px high, predominantly 4px radius.
- Light accent: `#0067c0`.
- Dark accent family: `#4cc2ff` / `#60cdff`.
- Stroke and state layers remain low-contrast neutral tones.

Applied to `ui/windows/theme.css`: 32px controls and 4px radius were already
present; the accent tokens were corrected to `#0067c0` (light) and `#4cc2ff`
(dark).

## Windows 10 / FluentWinUI

- Text: Segoe UI, primarily 14px.
- Accent: `#0078d7`.
- Controls: 32px high with 2px radius.

The existing `ui/windows10/theme.css` already matches those measurements.

## Licensing boundary

The Apple kit states that Apple Design Resources may not be embedded in
software or redistributed. The macOS theme therefore uses only independently
written CSS and measured dimensions; no Apple resource is bundled. Windows,
GNOME, KDE, and Ubuntu kit assets are likewise not copied. The themes use open
font files only where their own licences permit redistribution.
