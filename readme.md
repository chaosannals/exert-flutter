# exert-flutter

国内镜像

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

## windows 下安装

参考 [官网](https://flutter.dev/docs/get-started/install)

下载开发包，解压后把目录下的 bin 目录加到 Path 路径里面。

```bash
# 检查 flutter 安装的情况
flutter doctor
```

安装 VSCode Flutter 扩展。

注：本机因为早安装了 Android Studio 和 Visual Studio 2019 所以编译的阶段直接就过了，但是可能有安装这些编译工具的需求。具体看打包的平台。


注：安装 Android Studio 后，需要打开 Android SDK 的命令行工具，
SDK Manager 找到 Android SDK 》 SDK Tools 》 Android SDK Command-line Tools(latest)

注：安装 Android Studio 后，需要打开 Android SDK 的平台相关工具，找到 Android SDK 》 SDK Tools 》 Android SDK Platform-Tools

注：3.0.0 - 3.0.1 出现不兼容 VS 的情况，3.0.3 就不会。如果出现类似情况，回退版本或者更新版本。

代理
```pwsh
$env:HTTP_PROXY="http://127.0.0.1:1088"
$env:HTTPS_PROXY="https://127.0.0.1:1088"
```

 [插件网](https://pub.dev)

## 常用命令

```bash
# 更新
flutter upgrade

# 创建项目
flutter create app_name
```

```bash
# 查看项目支持设备
flutter devices

# 执行
flutter run
```

```bash
# 添加库 dartssh2
flutter pub add dartssh2
```