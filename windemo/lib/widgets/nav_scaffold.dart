import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/page_routes.dart';

class NavScaffold extends StatefulWidget {
  final String title;
  final Widget body;

  const NavScaffold({super.key, required this.body, this.title = ""});

  @override
  State<NavScaffold> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Container(
            width: 100.w,
            color: Colors.cyan,
            child: Column(
              children: [
                GestureDetector(
                  child: const Text("首页"),
                  onTap: () {
                    HomePageRoute().go(context);
                  },
                ),
                GestureDetector(
                  child: const Text("布局"),
                  onTap: () {
                    LayoutDemoListPageRoute().go(context);
                  },
                ),
                GestureDetector(
                  child: const Text("动画"),
                  onTap: () {
                    AnimationListPageRoute().go(context);
                  },
                ),
                GestureDetector(
                  child: const Text("表单"),
                  onTap: () {
                    FormListPageRoute().go(context);
                  },
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: widget.body,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'ball',
        child: const Icon(Icons.add),
      ),
    );
  }
}
