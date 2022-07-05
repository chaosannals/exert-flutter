import 'package:flutter/material.dart';
// import 'package:sshclient/dao/config_dao.dart';
import 'package:sshclient/database.dart';
import 'package:sshclient/entity/config.dart';

class ConfPage extends StatefulWidget {
  const ConfPage({Key? key}) : super(key: key);

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  final hostController = TextEditingController();
  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  void loadConfig() async {
    final db = await $FloorAppDatabase.databaseBuilder('sshclient.db').build();
    final configDao = db.configDao;

    // await configDao.updateConfig(ConfigEntity(1, "n0", "n0"));

    final configs = await configDao.findAllConfigs();
    final Map<String, String> config = {};
    for (var conf in configs) {
      config[conf.tag] = conf.value;
    }
    if (config.containsKey("host")) {
      hostController.text = config["host"]!;
    }
    if (config.containsKey("account")) {
      accountController.text = config["account"]!;
    }
    if (config.containsKey("password")) {
      passwordController.text = config["password"]!;
    }
    print("init db");
  }

  void saveConfig() async {
    final db = await $FloorAppDatabase
        .databaseBuilder('sshclient.db')
        .build();
    final configDao = db.configDao;
    await configDao.updateConfig(ConfigEntity(10, 'host', hostController.text));
    await configDao.updateConfig(ConfigEntity(11, 'account', accountController.text));
    await configDao.updateConfig(ConfigEntity(12, 'password', passwordController.text));
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
          margin: const EdgeInsets.all(10),
          child: TextButton(
            onPressed: () {
              print('pressed');
              saveConfig();
            },
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 0),
            ),
            //textColor: Colors.white,
            child: const Text("保存"),
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
