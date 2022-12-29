import 'package:flutter/material.dart';

class NavScaffold extends StatefulWidget {
  final String title;
  final Widget body;

  const NavScaffold({super.key, required this.body, this.title = ""});

  @override
  State<NavScaffold> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'ball',
        child: const Icon(Icons.add),
      ),
    );
  }
}
