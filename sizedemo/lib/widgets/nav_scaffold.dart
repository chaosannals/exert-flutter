import 'package:flutter/material.dart';
import 'package:sizedemo/pages/gist_page.dart';

import '../page.dart';
import '../pages/home_page.dart';

class NavScaffold extends StatefulWidget {
  final String title;
  final Widget? body;
  const NavScaffold({super.key, this.title = '', required this.body});

  @override
  State<StatefulWidget> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  String? title;

  _NavScaffoldState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? widget.title),
      ),
      body: widget.body,
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                await Navigator.push(context,
                    MyRoute(builder: (context) {
                  return const GistPage();
                }));
              },
              icon: const Icon(Icons.star),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                    context, MyRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/web');
              },
              icon: const Icon(Icons.network_cell),
            ),
          ),
        ],
      ),
    );
  }
}
