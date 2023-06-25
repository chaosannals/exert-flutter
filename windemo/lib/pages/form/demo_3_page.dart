import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/nav_scaffold.dart';

class FormDemo3Page extends StatefulWidget {
  const FormDemo3Page({super.key});

  @override
  State<FormDemo3Page> createState() => _FormDemo3PageState();
}

class _FormDemo3PageState extends State<FormDemo3Page> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          // 不是用 Form 也就没有 表单的检查。
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3.w,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
