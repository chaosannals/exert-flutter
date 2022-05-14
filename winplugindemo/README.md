# winplugindemo

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The plugin project was generated without specifying the `--platforms` flag, no platforms are currently supported.
To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.


注：flutter 3.0 VS2022 有 bug 无法开发 windows. 有些操作会自动升级，所以注意版本。可用 2.10.5 版本开发。

```bash
# 查看版本
flutter --version
```

```bash
# 添加平台，会生成一个标准模板 windows 目录
flutter create -t plugin --platforms windows .
# 使能
flutter config --enable-windows-desktop
# 重启编辑器来加载配置。

```

pubspec.yaml 需要把插件类添加进去配置

```yml
flutter:
  plugin:
    platforms:
      windows: # 在 pubspec.yaml 这里 加入这两行
        pluginClass: WinplugindemoPlugin
```

Windows 下调试需要开启 开发人员模式。

```bash
# 可查看调试信息
flutter run -d windows -v
```