import 'package:flutter/material.dart';

import '../../widgets/nav_scaffold.dart';

class FormDemo1Page extends StatefulWidget {
  const FormDemo1Page({super.key});

  @override
  State<FormDemo1Page> createState() => _FormDemo1PageState();
}

class _FormDemo1PageState extends State<FormDemo1Page> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  String validResult = "";

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _nameController,
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _passController,
              validator: (v) {
                return v!.trim().length >= 6 ? null : "密码不能少于 6 位";
              },
            ),
            ElevatedButton(
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  setState(() {
                    validResult = "验证通过";
                  });
                } else {
                  setState(() {
                    validResult = "验证不通过";
                  });
                }
              },
              child: Text("提交"),
            ),
            Text(
              validResult,
            )
          ],
        ),
      ),
    );
  }
}
