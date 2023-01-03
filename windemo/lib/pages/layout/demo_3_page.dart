import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo3Page extends StatefulWidget {
  const LayoutDemo3Page({super.key});

  @override
  State<LayoutDemo3Page> createState() => _LayoutDemo3PageState();
}

class _LayoutDemo3PageState extends State<LayoutDemo3Page> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Container(
        width: 100.w,
        height: 500.w,
        // child: Scrollbar( // 这个加了报错。
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: List<int>.generate(20, (i) => i + 1).map((i) {
                return Text(
                  "no: $i",
                  textScaleFactor: 2.0,
                );
              }).toList(),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
