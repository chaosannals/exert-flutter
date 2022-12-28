import 'package:flutter/material.dart';
import 'package:ssh2client/page_route.dart';

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
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        padding: EdgeInsets.zero,
        child: widget.body,
      ),
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
                StarPageRoute().go(context);
              },
              icon: const Icon(Icons.star),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                HomePageRoute().go(context);
              },
              icon: const Icon(Icons.home),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                ConfPageRoute().go(context);
              },
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
