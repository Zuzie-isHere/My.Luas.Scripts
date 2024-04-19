[TOC]

### Themes

#### Setting

configs:

```javascript
{
    // Editor.md theme, default or dark, change at v1.5.0
    // You can also custom css class .editormd-theme-xxxx
    theme : "default | dark",

    // Preview container theme, added v1.5.0
    // You can also custom css class .editormd-preview-theme-xxxx
    previewTheme : "default | dark",

    // Added @v1.5.0 & after version this is CodeMirror (editor area) theme
    editorTheme : editormd.editorThemes['theme-name']
}
```

functions:

```javascript
editor.setTheme('theme-name');
editor.setEditorTheme('theme-name');
editor.setPreviewTheme('theme-name');
```

