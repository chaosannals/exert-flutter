import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';

class Adapt {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double dpr = 0;
  static double ratio = 1.0;
  static double statusBarHeight = 0;
  static double bottomHeight = 0;

  static void initialize(BuildContext context, {double designWidth = 375}) {
    final mediaQueryData = MediaQuery.of(context);

    // 2.获取宽度和高度
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //像素比
    dpr = window.devicePixelRatio;

    // 3.状态栏的高度
    // 顶部有刘海:47pt 没有刘海的屏幕为20pt
    statusBarHeight = mediaQueryData.padding.top;
    // 底部有刘海:34pt 没有刘海的屏幕0pt
    bottomHeight = mediaQueryData.padding.bottom;
    //比例
    ratio = screenWidth / designWidth;
  }

  Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // IOS设备
      return await deviceInfo.iosInfo;
    }

    if (Platform.isAndroid) {
      //Android设备
      return await deviceInfo.androidInfo;
    }

    // ... 其他平台设备

    return null;
  }
}

extension NumUnit on num {
  // 与 designWidth 对应的单位。
  double toUnit() {
    return this * Adapt.ratio;
  }

  double get unit => this * Adapt.ratio;

  int toIntUnit() {
    return (this * Adapt.ratio).round();
  }

  int get intUnit => (this * Adapt.ratio).round();
}
