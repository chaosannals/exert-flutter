import 'package:flutter/material.dart';

import '../widgets/nav_scaffold.dart';

class GistPage extends StatefulWidget {
  const GistPage({super.key});

  @override
  State<GistPage> createState() => _GistPageState();
}

class _GistPageState extends State<GistPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      title: '概览',
      body: Column(),
    );
  }
}

