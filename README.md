<p align="center">
  <img src="https://raw.githubusercontent.com/Nota-MD/Nota/main/src-tauri/icons/nota.svg" width="82" alt="Nota">
</p>

<h1 align="center">Nota Themes</h1>

<p align="center">Official interface themes and document themes for Nota.</p>

<p align="center">
  <a href="README.zh-CN.md">简体中文</a> ·
  <a href="https://github.com/Nota-MD/Nota/releases">Nota releases</a> ·
  <a href="https://nota-md.github.io/docs/">Documentation</a>
</p>

![Interface themes in Nota](docs/images/interface-themes-light.png)

Nota keeps two visual axes independent:

- **Interface themes** change menus, sidebars, controls, icons and the interface font.
- **Document themes** change the writing surface and exported document styling.

## Interface themes

| Theme | Directory | CSS id |
|---|---|---|
| Adwaita | [`ui/adwaita`](ui/adwaita/) | `adwaita` |
| GitHub | [`ui/ghub`](ui/ghub/) | `ghub` |
| Breeze / Plasma | [`ui/plasma`](ui/plasma/) | `plasma` |
| macOS | [`ui/macos`](ui/macos/) | `macos` |
| Windows 11 | [`ui/windows`](ui/windows/) | `windows` |
| Windows 10 | [`ui/windows10`](ui/windows10/) | `windows10` |
| Yaru | [`ui/yaru`](ui/yaru/) | `yaru` |
| CDE-inspired | [`ui/cde`](ui/cde/) | `cde` |

The CDE interface theme is intentionally a single classic palette. Nota's global
light/dark setting is accepted, but both values resolve to the same CDE colors.

### Install an interface theme

1. Open **Settings → Appearance → Styles folder…** in Nota.
2. Copy the self-contained theme directory (`<id>/theme.css` plus assets).
3. The directory name becomes the theme id.
4. Select the theme under **Interface style**.

![Yaru settings](docs/images/yaru-settings.png)

## Document themes

| Theme | File |
|---|---|
| Adwaita | [`document/adwaita/theme.css`](document/adwaita/theme.css) |
| Adwaita Dark | [`document/adwaita-dark/theme.css`](document/adwaita-dark/theme.css) |
| Minimal | [`document/minimal/theme.css`](document/minimal/theme.css) |
| Minimal Dark | [`document/minimal-dark/theme.css`](document/minimal-dark/theme.css) |
| LaTeX | [`document/latex/theme.css`](document/latex/theme.css) |
| LaTeX Dark | [`document/latex-dark/theme.css`](document/latex-dark/theme.css) |
| CDE-inspired | [`document/cde/theme.css`](document/cde/theme.css) |
| Vellum | [`document/vellum/theme.css`](document/vellum/theme.css) |

### Install a document theme

1. Open **Settings → Document Themes → Open…**.
2. Copy the self-contained theme directory (`<id>/theme.css` plus assets).
3. Select it from the **Theme** menu.

Package rules are documented in [`docs/PACKAGE-SPEC.md`](docs/PACKAGE-SPEC.md).
The measurements and licensing boundaries used for the current system themes
are recorded in [`docs/FIGMA-ANALYSIS.md`](docs/FIGMA-ANALYSIS.md).

![CDE-inspired theme](docs/images/cde.png)

![Vellum document theme](docs/images/vellum.png)

![Light and dark interface themes](docs/images/interface-themes-dark.png)

## Downloads and updates

Theme packages are available under [Releases](https://github.com/Nota-MD/Nota-themes/releases).

Version, compatibility and download locations are also published in
[`latest.json`](latest.json). Consumers should ignore unknown fields.

## Contributing

Themes must use only CSS and declared assets, work without theme-specific code in the Nota
binary, include licenses for bundled assets, preserve keyboard focus, and be tested in light
and dark modes unless the style intentionally defines a single palette.

See the [theme tutorial](https://nota-md.github.io/docs/#/developer/themes/README) for the file
format and test checklist.

## License

Theme source is BSD-2-Clause unless a directory states otherwise. Third-party fonts and icons
retain their own licenses; see [`THIRD-PARTY.md`](THIRD-PARTY.md).

## Bundled fonts

- Yaru bundles Ubuntu and Ubuntu Mono (Ubuntu Font Licence 1.0).
- Adwaita bundles Adwaita Sans and Adwaita Mono (SIL Open Font License 1.1).
- LaTeX and LaTeX Dark bundle New Computer Modern Serif/Sans/Mono (GUST Font
  License) and retain the upstream LaTeX theme's Apache-2.0 notice.
- Vellum bundles Special Elite (Apache-2.0) and Huiwen Mincho GBK (author
  statement permitting personal and commercial use).

Each theme keeps its font licences in its own `assets/fonts/` directory. These
acknowledgements are intentionally package-local and are not copied into the
Nota About credits.
