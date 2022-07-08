# sshclient

```bash
# 生成数据库代码
flutter packages pub run build_runner build lib
```

```pwsh
$env:HTTPS_PROXY="127.0.0.1:1088"
```

local.properties 可以设置 变量（目前 flutter 开头的好像无效。）
```ini
sdk.dir=C\:\\Users\\YourName\\AppData\\Local\\Android\\Sdk
flutter.minSdkVersion=21
flutter.targetSdkVersion=31
```

注：以上无效时 直接改动 android/app/build.gradle 。

```
defaultConfig {
    minSdkVersion 21
    targetSdkVersion 31
}
```