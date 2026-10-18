<p align="center">
  <img src="https://raw.githubusercontent.com/Nota-MD/Nota/main/src-tauri/icons/nota.svg" width="82" alt="Nota">
</p>

<h1 align="center">Nota Themes</h1>

<p align="center">Nota 官方界面主题与文档主题仓库。</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="https://github.com/Nota-MD/Nota/releases">Nota 版本下载</a> ·
  <a href="https://nota-md.github.io/docs/">在线文档</a>
</p>

![Nota 界面主题合集](docs/images/interface-themes-light.png)

Nota 把外观分成两套独立主题：

- **界面主题**改变菜单、侧栏、按钮、图标和界面字体
- **文档主题**改变正文页面、标题、代码块和正文排版

## 界面主题

| 主题 | 目录 | CSS id |
|---|---|---|
| Adwaita | [`ui/adwaita`](ui/adwaita/) | `adwaita` |
| GitHub | [`ui/github`](ui/github/) | `ghub` |
| Breeze / Plasma | [`ui/breeze`](ui/breeze/) | `plasma` |
| macOS | [`ui/macos`](ui/macos/) | `macos` |
| Windows 11 | [`ui/windows11`](ui/windows11/) | `windows` |
| Windows 10 | [`ui/windows10`](ui/windows10/) | `windows10` |
| Yaru | [`ui/yaru`](ui/yaru/) | `yaru` |
| CDE-inspired | [`ui/cde`](ui/cde/) | `cde` |

### 安装界面主题

1. 打开 Nota 的 **设置 → 外观 → 风格文件夹…**
2. 将主题 CSS 与 `assets/` 目录复制进去
3. CSS 文件名就是主题 id，例如 `yaru.css` 对应 `yaru`
4. 在“界面风格”中选择主题

![Yaru 设置界面](docs/images/yaru-settings.png)

## 文档主题

| 主题 | 文件 |
|---|---|
| Adwaita | [`document/adwaita/theme.css`](document/adwaita/theme.css) |
| Adwaita 深色 | [`document/adwaita/dark.css`](document/adwaita/dark.css) |
| 极简 | [`document/minimal.css`](document/minimal.css) |
| 极简深色 | [`document/dark/minimal.css`](document/dark/minimal.css) |
| LaTeX | [`document/latex.css`](document/latex.css) |
| LaTeX 深色 | [`document/dark/latex.css`](document/dark/latex.css) |
| CDE | [`document/cde.css`](document/cde.css) |

### 安装文档主题

1. 打开 **设置 → 文档主题 → 打开…**
2. 将需要的 `.css` 文件放入主题目录
3. 从“主题”菜单选择

![CDE 风格主题](docs/images/cde.png)

![浅色与深色界面主题](docs/images/interface-themes-dark.png)

## 下载与更新

主题包从 [Releases](https://github.com/Nota-MD/Nota-themes/releases) 下载。

版本、兼容范围和下载地址同时发布在 [`latest.json`](latest.json)，使用方可忽略其中不认识的字段。

## 贡献

主题必须只使用 CSS 和声明的资源，不需要主程序加入主题专用分支；随附字体、图像和图标许可证；
保持键盘焦点可见、文字对比度可读，并在浅色与深色界面下完成实测。

主题编写教程见 [Nota 文档](https://nota-md.github.io/docs/#/developer/themes/README)。

## 许可证

主题源码使用 BSD-2-Clause，除非主题目录内另有说明。第三方字体与图标继续使用各自许可证，
详见 [`THIRD-PARTY.md`](THIRD-PARTY.md)。
