# Nota theme package specification

Recommended layout:

```text
themes/<theme-id>/theme.css
ui-styles/<theme-id>/theme.css
```

Resources are resolved relative to the main CSS and must stay inside the
theme package. Flat `<theme-id>.css` files in the root directory are ignored.

Document themes use `#write` for the content root and are mechanically scoped
to the editor. Interface themes must scope every component selector with
`[data-ui-style="<theme-id>"]`.

The authoritative specification is maintained in
[`Nota/docs/reference/theme-package-spec.md`](https://github.com/Nota-MD/Nota/blob/main/docs/reference/theme-package-spec.md).
