import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many tim:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(children: const <Widget>[
              Text('1'),
              Text('2'),
            ])
          ],
        ),
      );
  }
}
