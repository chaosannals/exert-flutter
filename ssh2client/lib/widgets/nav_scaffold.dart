import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavScaffold extends StatefulWidget {
  final String title;
  final Widget body;

  const NavScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  State<StatefulWidget> createState() => _NavScaffoldState();
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
        tooltip: '+',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                context.go('/star');
              },
              icon: const Icon(Icons.star),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.home),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                context.go('/conf');
              },
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
