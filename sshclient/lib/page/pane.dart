import 'dart:convert';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:sshclient/util/config.dart';

class PanePage extends StatefulWidget {
  const PanePage({Key? key}) : super(key: key);

  @override
  State<PanePage> createState() => _PanePageState();
}

class _PanePageState extends State<PanePage> {
  var outputController = TextEditingController();
  var inputController = TextEditingController();
  SSHClient? client;

  Future<SSHClient> getClient() async {
    if (client == null) {
      var config = await getConfig();
      var result = SSHClient(
        await SSHSocket.connect(config.host, int.parse(config.port)),
        username: config.account,
        onPasswordRequest: () => config.password,
      );
      client = result;
      print('new ssh client');
    }
    print('init ssh client');
    return client!;
  }

  Future<SSHSession> getShell() async {
    await getClient();
    var shell = await client!.shell();
    print('init ssh shell');
    return shell;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    client?.close();
    super.dispose();
    print('ssh dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: TextField(
              controller: outputController,
              maxLines: null,
              minLines: null,
              expands: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'console',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 6),
          child: TextField(
            controller: inputController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'input',
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: TextButton(
                  onPressed: () async {},
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.white
                          : Colors.black;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.blue
                          : Colors.grey;
                    }),
                  ),
                  child: const Text('Tab'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: TextButton(
                  onPressed: () async {
                    var cmd = inputController.text;
                    // var shell = await getShell();
                    // shell.write(cmd);
                    // await shell.done;
                    await getClient();
                    final out = await client!.run(cmd, stderr: false);
                    //print(utf8.decode(out));
                    outputController.text = utf8.decode(out);
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.grey
                          : Colors.white;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.lightBlue
                          : Colors.blue;
                    }),
                  ),
                  child: const Text('Enter'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
