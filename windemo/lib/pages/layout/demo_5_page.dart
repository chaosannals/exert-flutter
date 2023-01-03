import 'package:flutter/material.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo5Page extends StatefulWidget {
  const LayoutDemo5Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo5PageState();
}

class _LayoutDemo5PageState extends State<LayoutDemo5Page> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(),
    );
  }
}
