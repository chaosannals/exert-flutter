import 'package:flutter/material.dart';
import 'package:ssh2client/widgets/nav_scaffold.dart';

class StarPage extends StatefulWidget {
  const StarPage({super.key});

  @override
  State<StatefulWidget> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  Widget build(BuildContext context) {
    return const NavScaffold(
      title: "Star",
      body: Center(),
    );
  }
}
