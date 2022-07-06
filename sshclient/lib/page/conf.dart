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

  Future<int?> showClearDialog() {
    return showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(0), // 关闭对话框
            ),
            TextButton(
              child: const Text("清空内容"),
              onPressed: () => Navigator.of(context).pop(1), // 关闭对话框
            ),
            TextButton(
              child: const Text("删除保存"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(2);
              },
            ),
          ],
        );
      },
    );
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
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: [Colors.grey, Colors.grey.shade700]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: TextButton(
                      onPressed: () async {
                        var r = await showClearDialog();
                        if (r! >= 1) {
                          hostController.text = '';
                          portController.text = '';
                          accountController.text = '';
                          passwordController.text = '';
                        }
                        if (r == 2) {
                          await saveConfig();
                        }
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
                      child: const Text('清空'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: [Colors.grey, Colors.grey.shade700]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
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
                        foregroundColor:
                            MaterialStateProperty.resolveWith((status) {
                          return status.contains(MaterialState.pressed)
                              ? Colors.grey
                              : Colors.white;
                        }),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((status) {
                          return status.contains(MaterialState.pressed)
                              ? Colors.lightBlue
                              : Colors.blue;
                        }),
                      ),
                      child: const Text('保存'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
