import 'package:flutter/material.dart';
import 'package:sizedemo/pages/gist_page.dart';
import 'package:sizedemo/pages/home_page.dart';
import 'package:sizedemo/pages/web_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/gist': (context) => const GistPage(),
        '/web': (context) => const WebPage(),
      },
    );
  }
}
