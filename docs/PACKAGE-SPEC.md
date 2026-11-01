# Nota theme package specification

Recommended layout:

```text
themes/<theme-id>/theme.css
ui-styles/<theme-id>/theme.css
```

Resources are resolved relative to the main CSS and must stay inside the
theme package. Flat `<theme-id>.css` files in the root directory are ignored.

Interface themes can replace built-in SVG shapes by declaring logical icon
variables such as `--icon-nota-heading-1-symbolic`. Editor gutter markers use
`--nota-source-quote-icon`, `--nota-source-bullet-icon` and
`--nota-source-code-icon`; the application owns their positioning.

Document themes use `#write` for the content root and are mechanically scoped
to the editor. Interface themes must scope every component selector with
`[data-ui-style="<theme-id>"]`.

Settings dropdowns are self-drawn comboboxes. Interface themes control the
closed trigger and the portalled list through `--select-*` variables or the
`.stg-select-trigger`, `.stg-select-popup`, and `.stg-select-option` selectors.
Do not target native `<option>` elements.

The authoritative specification is maintained in
[`Nota/docs/reference/theme-package-spec.md`](https://github.com/Nota-MD/Nota/blob/main/docs/reference/theme-package-spec.md).
