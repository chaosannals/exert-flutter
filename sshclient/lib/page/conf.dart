import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sshclient/database.dart';
import 'package:sshclient/entity/config.dart';

class ConfPage extends StatefulWidget {
  const ConfPage({Key? key}) : super(key: key);

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  final hostController = TextEditingController();
  final portController = TextEditingController();
  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  void loadConfig() async {
    final db = await $FloorAppDatabase.databaseBuilder('sshclient.db').build();
    final configDao = db.configDao;

    final config = await configDao.findConfigById(1);
    if (config == null) {
      await configDao.insertConfig(ConfigEntity(1));
    } else {
      hostController.text = config.host;
      portController.text = config.port;
      accountController.text = config.account;
      passwordController.text = config.password;
    }
    print("init db");
    print(config);
  }

  Future<void> saveConfig() async {
    final db = await $FloorAppDatabase.databaseBuilder('sshclient.db').build();
    final configDao = db.configDao;
    final config = ConfigEntity(1);
    config.host = hostController.text;
    config.port = portController.text;
    config.account = accountController.text;
    config.password = passwordController.text;
    config.updateAt = DateTime.now().toString();
    await configDao.updateConfig(config);
  }

  @override
  void initState() {
    super.initState();
    loadConfig();
  }

  @override
  void dispose() {
    hostController.dispose();
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: hostController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Host',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: portController,
            keyboardType: TextInputType.number,
            obscureText: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Port',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: accountController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Account',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Container(
          // color: Colors.red,
          margin: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: null,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey,
                    ),
                  ),
                  // style: TextButton.styleFrom(
                  //   textStyle: const TextStyle(
                  //     fontSize: 20,
                  //   ),
                  //   onSurface: Colors.blue,
                  //   backgroundColor: Colors.grey,
                  // ),
                  child: const Text('清空'),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () async {
                    print('pressed');
                    await saveConfig();
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                  ),
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(2),
        //   child: Stack(children: <Widget>[
        //     Positioned.fill(
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(colors: <Color>[
        //             Color(0x3399FFFF),
        //             Color(0xFF1976D2),
        //             Color(0xFF42A5F5),
        //           ]),
        //         ),
        //       ),
        //     ),
        //     TextButton(
        //       style: TextButton.styleFrom(
        //         textStyle: const TextStyle(
        //           fontSize: 20,
        //         ),
        //       ),
        //       onPressed: null,
        //       child: const Text('保存'),
        //     ),
        //   ]),
        // ),
      ],
    );
  }
}
