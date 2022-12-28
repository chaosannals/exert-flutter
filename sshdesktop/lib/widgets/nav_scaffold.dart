import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sshdesktop/page_route.dart';

class NavScaffold extends StatefulWidget {
  final Widget child;

  const NavScaffold({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('SSH Desktop'),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 44.0),
        child: Row(
          children: [
            Container(
              width: 100.w,
              decoration: const BoxDecoration(color: Colors.cyan),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      HomePageRoute().go(context);
                    },
                    child: const Text("首页"),
                  ),
                  TextButton(
                    onPressed: () {
                      ProjectListPageRoute().go(context);
                    },
                    child: const Text("项目管理"),
                  ),
                  TextButton(
                    onPressed: () {
                      SshListPageRoute().go(context);
                    },
                    child: const Text("账号管理"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
