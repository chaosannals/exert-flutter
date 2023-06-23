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
            child: const Text("示例 1"),
          ),
        ],
      ),
    );
  }
}
