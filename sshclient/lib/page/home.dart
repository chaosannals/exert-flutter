import 'package:flutter/material.dart';
import 'package:sshclient/page/conf.dart';
import 'package:sshclient/page/gist.dart';
import 'package:sshclient/page/pane.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//
class _MyHomePageState extends State<MyHomePage> {
  final pages = [
    const PanePage(key: PageStorageKey<String>('pagePane')),
    const GistPage(key: PageStorageKey<String>('pageGist')),
    const ConfPage(key: PageStorageKey<String>('pageConf')),
  ];
  int currentPage = 0;
  DateTime? lastPopAt;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (lastPopAt == null ||
            DateTime.now().difference(lastPopAt!) >
                const Duration(seconds: 1)) {
          lastPopAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageStorage(
          bucket: _bucket,
          child: pages[currentPage],
        ),
        floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: const Icon(Icons.home),
          onPressed: () {
            if (1 != currentPage) {
              setState(() => {currentPage = 1});
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  if (0 != currentPage) {
                    setState(() => {currentPage = 0});
                  }
                },
              ),
              const SizedBox(), //中间位置空出
              IconButton(
                icon: const Icon(Icons.business),
                onPressed: () {
                  if (2 != currentPage) {
                    setState(() => {currentPage = 2});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
