import 'package:flutter/cupertino.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const <Widget> [
          Text('message'),
        ],
      ),
    );
  }

}