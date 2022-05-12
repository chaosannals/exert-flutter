// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';
// import 'dart:ffi';
// import 'dart:io';

import 'package:flutter/services.dart';

// final DynamicLibrary nativeAddLib = Platform.isMacOS || Platform.isIOS
//     ? DynamicLibrary.process()
//     : DynamicLibrary.open("libNativeAdd.${Platform.isWindows ? 'dll' : 'so'}");

// final int Function(int x, int y) nativeAdd = nativeAddLib
//     .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('native_add')
//     .asFunction();

class Winplugindemo {
  static const MethodChannel _channel = MethodChannel('winplugindemo');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
   //final String? version = nativeAdd(1, 2).toString();
    return version;
  }
}
