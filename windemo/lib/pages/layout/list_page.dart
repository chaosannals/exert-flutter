import 'package:flutter/material.dart';
import 'package:windemo/page_routes.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemoListPage extends StatefulWidget {
  const LayoutDemoListPage({super.key});

  @override
  State<LayoutDemoListPage> createState() => _LayoutDemoListPageState();
}

class _LayoutDemoListPageState extends State<LayoutDemoListPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              LayoutDemo1PageRoute().go(context);
            },
            child: const Text("示例 1"),
          ),
          ElevatedButton(
            onPressed: () {
              LayoutDemo2PageRoute().go(context);
            },
            child: const Text("示例 2"),
          ),
          ElevatedButton(
            onPressed: () {
              LayoutDemo3PageRoute().go(context);
            },
            child: const Text("示例 3"),
          ),
          ElevatedButton(
            onPressed: () {
              LayoutDemo4PageRoute().go(context);
            },
            child: const Text("示例 4"),
          ),
        ],
      ),
    );
  }
}
