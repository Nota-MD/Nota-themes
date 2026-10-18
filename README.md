# Nota Themes

Official interface themes and document themes for Nota.

Nota keeps two visual axes independent:

- **Interface themes** change menus, sidebars, controls, icons and the interface font.
- **Document themes** change the writing surface and exported document styling.

## Interface themes

| Theme | Directory |
|---|---|
| CDE-inspired | [`ui/cde`](ui/cde/) |

### Install an interface theme

1. Open **Settings → Appearance → Styles folder…** in Nota.
2. Copy the theme CSS and all assets into that directory.
3. The CSS filename becomes the theme id. For example, `ui/cde/cde.css` becomes `cde`.
4. Select the theme under **Interface style**.

Theme resources use relative paths. Keep each theme's `assets/` directory together with its CSS.

## Document themes

| Theme | File |
|---|---|
| Adwaita | [`document/adwaita/theme.css`](document/adwaita/theme.css) |
| Adwaita Dark | [`document/adwaita/dark.css`](document/adwaita/dark.css) |
| Minimal | [`document/minimal.css`](document/minimal.css) |
| Minimal Dark | [`document/dark/minimal.css`](document/dark/minimal.css) |
| LaTeX | [`document/latex.css`](document/latex.css) |
| LaTeX Dark | [`document/dark/latex.css`](document/dark/latex.css) |
| CDE-inspired | [`document/cde.css`](document/cde.css) |

Adwaita light and dark are bundled with Nota. The remaining themes are maintained here as
official migration sources and standalone installable themes.

### Install a document theme

1. Open **Settings → Document Themes → Open…**.
2. Copy the desired `.css` file into the theme directory.
3. Select it from the **Theme** menu.

Document themes only affect the editor surface. A dark theme file is a color layer and should be
used with its matching light theme where noted.

## Contributing

Themes must:

- use only CSS and declared assets
- work without theme-specific code in the Nota binary
- include licenses for bundled fonts or artwork
- preserve keyboard focus and readable contrast
- be tested in light and dark interface modes

See the [theme tutorial](https://nota-md.github.io/docs/#/developer/themes/README) for the file
format and testing checklist.

## License

Theme source is BSD-2-Clause unless a theme directory states otherwise. Bundled third-party
assets retain their own licenses; see [`THIRD-PARTY.md`](THIRD-PARTY.md).
