import 'package:flutter/material.dart';

import '../../widgets/nav_scaffold.dart';

class SshConfPage extends StatefulWidget {
  const SshConfPage({super.key});

  @override
  State<StatefulWidget> createState() => _SshConfPageState();
}

class _SshConfPageState extends State<SshConfPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(title: "SSH配置", body: Column());
  }
}
