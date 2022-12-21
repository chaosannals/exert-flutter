import 'package:flutter/material.dart';
import 'package:ssh2client/widgets/nav_scaffold.dart';

class ConfPage extends StatefulWidget {
  const ConfPage({super.key});

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      title: "设置",
      body: Column(),
    );
  }
}
