import 'package:flutter/material.dart';

import '../../page_routes.dart';
import '../../widgets/nav_scaffold.dart';

class FormListPage extends StatefulWidget {
  const FormListPage({super.key});

  @override
  State<FormListPage> createState() => _FormListPageState();
}

class _FormListPageState extends State<FormListPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              FormDemo1PageRoute().go(context);
            },
            child: const Text("示例 1（集成度比较高的 material TextFormField）"),
          ),
          ElevatedButton(
            onPressed: () {
              FormDemo2PageRoute().go(context);
            },
            child: const Text("示例 2（集成度低的 widgets 的 EditableText 和自定义输入框）"),
          ),
          ElevatedButton(
            onPressed: () {
              FormDemo3PageRoute().go(context);
            },
            child: const Text("示例 3(没有 Form 只是孤立的输入框)"),
          ),
        ],
      ),
    );
  }
}
