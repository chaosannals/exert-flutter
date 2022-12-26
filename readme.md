# exert-flutter

国内镜像

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

```pwsh
$env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
```

```bat
set PUB_HOSTED_URL=https://pub.flutter-io.cn
set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

[安卓 gradle 阿里云镜像](https://developer.aliyun.com/mvn/guide)

```gradle
buildscript {
    //...
    repositories {
        // google()
        // mavenCentral()

        // 阿里镜像
        maven { url 'https://maven.aliyun.com/repository/central' }
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
    }
    //...
}

allprojects {
    repositories {
        // google()
        // mavenCentral()

        // 阿里镜像
        maven { url 'https://maven.aliyun.com/repository/central' }
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
    }
}
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

# 创建项目不指定平台为全平台（早期版本为无，需要手动添加）
flutter create app_name
# 给当前项目添加指定平台，最后 . 是当前路径。
flutter create --platforms=windows,macos,linux .

# 创建时指定平台
flutter create --platforms=windows,macos,linux app_name
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

# 添加开发库 build_runner
flutter pub add -d build_runner

# 拉库
flutter pub get

# 更新库
flutter pub update
```

## 配置

local.properties 和 android/local.properties 可以配置一些编译时的属性。（之前可以，之后升级 Flutter 作废了，直接改 build.gradle 文件）

```ini
sdk.dir=C:\\Android\\SDK
flutter.sdk=D:\\Flutter
flutter.minSdkVersion=21
flutter.targetSdkVersion=33
flutter.ndkVersion=21.0.6011959
flutter.versionCode=1
flutter.versionName=1.0.0
```