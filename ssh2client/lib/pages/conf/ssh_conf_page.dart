import 'package:flutter/material.dart';

import '../../widgets/nav_scaffold.dart';

class SshConfPage extends StatefulWidget {
  final int id;

  const SshConfPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _SshConfPageState();
}

class _SshConfPageState extends State<SshConfPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(title: "SSH ${widget.id} 配置", body: Column());
  }
}
