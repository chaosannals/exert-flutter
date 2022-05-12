import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:winplugindemo/winplugindemo.dart';

void main() {
  const MethodChannel channel = MethodChannel('winplugindemo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Winplugindemo.platformVersion, '42');
  });
}
