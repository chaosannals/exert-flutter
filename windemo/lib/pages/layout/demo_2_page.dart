import 'package:flutter/material.dart';
import 'package:windemo/widgets/after_layout.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo2Page extends StatefulWidget {
  const LayoutDemo2Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo2PageState();
}

class _LayoutDemo2PageState extends State<LayoutDemo2Page> {
  late String tip="";

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          AfterLayout(
            child: const Text("aaaa"),
            onAfter: (context) {
              setState(() {
                tip = "size: ${context.size}";
              });
            },
          ),
          Text("tip: $tip"),
        ],
      ),
    );
  }
}
