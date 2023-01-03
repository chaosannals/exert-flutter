import 'package:flutter/material.dart';

class AfterLayout extends StatefulWidget {
  final Widget child;
  final Function(BuildContext)? onAfter;

  const AfterLayout({super.key, required this.child, this.onAfter});

  @override
  State<StatefulWidget> createState() => _AfterLayoutState();
}

class _AfterLayoutState extends State<AfterLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) {
      widget.onAfter?.call(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
