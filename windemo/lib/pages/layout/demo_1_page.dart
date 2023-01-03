import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class _ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;

  const _ResponsiveColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
        } else {
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    children[i],
                    children[i + 1],
                  ],
                ),
              );
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: _children,
          );
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  final Widget child;
  final T? tag;

  const LayoutLogPrint({super.key, this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        assert(() {
          print('${tag ?? key ?? child}: $constraints');
          return true;
        }());
        return child;
      },
    );
  }
}

class LayoutDemo1Page extends StatefulWidget {
  const LayoutDemo1Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo1PageState();
}

class _LayoutDemo1PageState extends State<LayoutDemo1Page> {
  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, const Text("A"));
    return NavScaffold(
      body: Column(
        children: [
          SizedBox(
            width: 190.w,
            child: _ResponsiveColumn(
              children: _children,
            ),
          ),
          _ResponsiveColumn(children: _children),
          const LayoutLogPrint(child: Text("xxx")),
        ],
      ),
    );
  }
}
