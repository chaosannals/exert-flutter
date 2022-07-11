import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter()),
  );

  
}

class Global {
  static List<CameraDescription> _cameras = <CameraDescription>[];
  static List<CameraDescription> get cameras => _cameras;

  static Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      // _logError(e.code, e.description);
      print('camera error');
      print(e.code);
      print(e.description);
    }
  }
}
