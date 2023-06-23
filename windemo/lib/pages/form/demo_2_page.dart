import 'package:flutter/material.dart';

import '../../widgets/nav_scaffold.dart';

class FormDemo2Page extends StatefulWidget {
  const FormDemo2Page({super.key});

  @override
  State<FormDemo2Page> createState() => _FormDemo2PageState();
}

class _FormDemo2PageState extends State<FormDemo2Page> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Form(
        child: Column(),
      ),
    );
  }
}
