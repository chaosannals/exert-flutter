import 'package:flutter/material.dart';
import 'package:windemo/widgets/form_string_field.dart';

import '../../widgets/form_input.dart';
import '../../widgets/nav_scaffold.dart';

class FormDemo2Page extends StatefulWidget {
  const FormDemo2Page({super.key});

  @override
  State<FormDemo2Page> createState() => _FormDemo2PageState();
}

class _FormDemo2PageState extends State<FormDemo2Page> {
  String field1 = "1234";
  TextEditingController field2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Form(
        child: Column(
          children: [
            FormField<String>(
              enabled: true,
              builder: (state) {
                return FormInput(
                  value: field1,
                  onChanged: (v) {
                    setState(() {
                      field1 = v;
                    });
                  },
                );
              },
              onSaved: (v) {
                field1 = v ?? "";
              },
            ),
            FormStringField(
              controller: field2Controller,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
