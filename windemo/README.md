# windows demo

注：Windows 项目 VS编译 UTF8 必须带 BOM 不然乱码。（新版好想不会出现此类问题。）

```bash
# 全局安装构建工具。
flutter pub global activate build_runner

# 生成
flutter pub run build_runner build
```