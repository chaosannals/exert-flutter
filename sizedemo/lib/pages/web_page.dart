import 'package:flutter/material.dart';

import '../widgets/nav_scaffold.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      title: '网络',
      body: Column(),
    );
  }
}
