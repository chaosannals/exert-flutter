import 'package:flutter/cupertino.dart';

class ErrorPage extends StatefulWidget {
  final Exception? error;
  const ErrorPage({super.key, this.error});

  @override
  State<StatefulWidget> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
