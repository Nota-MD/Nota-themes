# Figma UI kit analysis

Rechecked locally on 2026-10-27 with `openfig-core` against the original
Figma archives. The earlier analysis used the same kits; this pass records the
current token sample and resulting CSS changes.

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
- Core palette: window `#fafafb`, sidebar `#ebebed`, view `#ffffff`, header
  `#ebebeb`, accent `#3584e4`.
- Dark palette: window `#222226`, sidebar `#2e2e32`, raised surface `#36363a`.

Applied to `ui/adwaita/theme.css`: 34px controls, 6px control radius, 48px
toolbar, 12px floating-surface radius, a 48×26 switch, the measured
`#ebebed` primary sidebar color, and 14px UI text.

## macOS

- Text: SF Pro, predominantly 10-15px.
- Standard push buttons: 22-28px high, 5-6px radius.
- Text fields: 22-28px high, 5px radius.
- Menu rows: 19-24px high; hover selection uses 5-8px radius.
- Toolbar/title bar: 38px.
- Window radius: 16px.

Applied to `ui/macos/theme.css`: 5px small radius and 6px standard control
radius. The existing 28px control height and 38px toolbar already match the
kit; UI text is set to 14px for Chinese legibility against the kit's 13px body.

## KDE Plasma 6

- Text: Noto Sans 12-14px for native controls.
- Settings rows: commonly 26-32px high, 5px radius.
- Search field: 26-30px high.
- Accent: `#3daee9`; the contrast-safe foreground is `#08202e`.

Applied to `ui/plasma/theme.css`: 28px controls, 5px standard radius, the
measured accent, and 14px UI text.

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
- Light surfaces: content `#f9f9f9`, chrome `#f6f6f6`, solid `#f3f3f3`.
- Dark surfaces: content `#282828`, chrome `#202020`, solid `#202020`.
- Stroke and state layers remain low-contrast neutral tones.

Applied to `ui/windows/theme.css`: 32px controls and 4px radius were already
present; the accent tokens were corrected to `#0067c0` (light) and `#4cc2ff`
(dark), and UI text follows the kit's 14px body size.

## Windows 10 / FluentWinUI

- Text: Segoe UI, primarily 14px.
- Accent: `#0078d7`.
- Controls: 32px high with 2px radius.

The existing `ui/windows10/theme.css` already matches the accent and control
height; UI text now follows the kit's 14px body size.

## IBM Carbon

Carbon's productive UI guidance and public packages were checked instead of a
redistributable Figma archive:

- Body text and controls use IBM Plex Sans at a 14px default.
- Productive controls are 32px high; regular controls are 40px high. Nota uses
  the compact 32px tier for its dense editor chrome.
- Buttons, fields, menus, and overlays use square or 0-2px corners.
- The light theme uses White/G10 surfaces: `#ffffff`, `#f4f4f4`, `#e0e0e0`,
  text `#161616`, secondary text `#525252`, and blue `#0f62fe`.
- The dark theme uses the G100 surface ladder: `#161616`, `#262626`, `#393939`,
  text `#f4f4f4`, secondary text `#c6c6c6`, and blue `#78a9ff`.
- Focus is shown with a visible blue perimeter; selection uses a 2px left or top
  blue edge instead of rounded pill-shaped active states.

Applied to `ui/carbon/theme.css`: 32px controls, 40px toolbar, 28px status bar,
zero-radius controls, 48x24px toggles, IBM Plex Sans SC/Mono, Carbon state
colors, and Carbon Icons under `assets/icons-theme/`.

## Licensing boundary

The Apple kit states that Apple Design Resources may not be embedded in
software or redistributed. The macOS theme therefore uses only independently
written CSS and measured dimensions; no Apple resource is bundled. Windows,
GNOME, KDE, and Ubuntu kit assets are likewise not copied. The themes use open
font files only where their own licences permit redistribution. Carbon colors
and icons are Apache-2.0; IBM Plex is OFL-1.1.
