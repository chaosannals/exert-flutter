import 'package:flutter/material.dart';
import 'package:windemo/page_routes.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class AnimationListPage extends StatefulWidget {
  const AnimationListPage({super.key});

  @override
  State<AnimationListPage> createState() => _AnimationListPageState();
}

class _AnimationListPageState extends State<AnimationListPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              AnimaDemo1PageRoute().go(context);
            },
            child: const Text("示例 1"),
          ),
          ElevatedButton(
            onPressed: () {
              AnimaDemo2PageRoute().go(context);
            },
            child: const Text("示例 2"),
          ),
        ],
      ),
    );
  }
}
