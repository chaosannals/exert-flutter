import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ssh2client/page_route.dart';
import 'package:ssh2client/widgets/nav_scaffold.dart';

class ConfPage extends StatefulWidget {
  const ConfPage({super.key});

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      title: "设置",
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                const Text("项目名"),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // context.goNamed(
                        //   'conf_project_page',
                        //   queryParams: { 'id': '1', },
                        // );
                        const ProjectConfPageRoute(id: 1)
                          .go(context);
                      },
                      child: const Text("编辑"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("执行"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
