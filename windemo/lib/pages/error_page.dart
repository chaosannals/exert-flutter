import 'package:flutter/material.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class ErrorPage extends StatefulWidget {
  final Exception? error;

  const ErrorPage({super.key, this.error});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("错误"),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'ball',
        child: const Icon(Icons.add),
      ),
    );
  }
}
