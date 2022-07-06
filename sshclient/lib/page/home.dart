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
    const PanePage(),
    const GistPage(),
    const ConfPage(),
  ];
  int currentPage = 0;
  DateTime? lastPopAt;

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
        body: pages[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '面板',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: '概览',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '设置',
            ),
          ],
          onTap: (index) => {
            if (index != currentPage)
              {
                setState(() => {currentPage = index})
              }
          },
        ),
      ),
    );
  }
}
