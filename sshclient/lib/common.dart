import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger? _logger;

  static void v(dynamic message) {
    _logger!.v(message);
  }

  static void d(dynamic message) {
    _logger!.d(message);
  }

  static void i(dynamic message) {
    _logger!.i(message);
  }

  static void w(dynamic message) {
    _logger!.w(message);
  }

  static void e(dynamic message) {
    _logger!.e(message);
  }

  static void wtf(dynamic message) {
    _logger!.wtf(message);
  }

  static void init() {
    _logger = Logger(
      printer: PrefixPrinter(PrettyPrinter()),
    );
  }
}

class Global {
  static List<CameraDescription> _cameras = <CameraDescription>[];
  static List<CameraDescription> get cameras => _cameras;

  static Future init() async {
    try {
      Log.init();
      Log.i('global init');
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      Log.e("camera error: ${e.code} ${e.description}");
    }
  }
}
