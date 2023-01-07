import 'package:flutter/material.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class _Demo1Page extends StatefulWidget {
  const _Demo1Page({super.key});

  @override
  State<StatefulWidget> createState() => _Demo1PageState();
}

class _Demo1PageState extends State<_Demo1Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: Row(
        children: const [
          Expanded(
            child: Center(
              child: Text("1"),
            ),
          ),
        ],
      ),
    );
  }
}

class _Demo2Page extends StatelessWidget {
  final String tip;
  final double fontScale;

  const _Demo2Page({super.key, required this.tip, required this.fontScale});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.limeAccent,
      ),
      child: Center(
        child: Text(tip, textScaleFactor: fontScale),
      ),
    );
  }
}

class LayoutDemo6Page extends StatefulWidget {
  const LayoutDemo6Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo6PageState();
}

class _LayoutDemo6PageState extends State<LayoutDemo6Page> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      const _Demo1Page(),
    ];
    for (int i = 0; i < 6; ++i) {
      children.add(_Demo2Page(
        tip: '$i',
        fontScale: 1 + i.toDouble() * 0.5,
      ));
    }
    return NavScaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.red),
            left: BorderSide(color: Colors.blue),
            right: BorderSide(color: Colors.yellow),
            bottom: BorderSide(color: Colors.green),
          ),
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          allowImplicitScrolling: true, // 缓存前后一个页面，因为ios的问题，统一只能缓存1个页面。
          children: children,
        ),
      ),
    );
  }
}
