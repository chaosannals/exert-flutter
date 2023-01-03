import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo4Page extends StatefulWidget {
  const LayoutDemo4Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo4PageState();
}

class _LayoutDemo4PageState extends State<LayoutDemo4Page> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return Text("no: $index");
              },
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.w),
              children: List<int>.generate(20, (i) => i + 1).map((i) {
                return Text(
                  "No: $i",
                  textScaleFactor: 2.0,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
