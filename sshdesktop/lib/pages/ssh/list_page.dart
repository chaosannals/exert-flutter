import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sshdesktop/widgets/nav_scaffold.dart';

class SshListPage extends StatefulWidget {
  const SshListPage({super.key});

  @override
  State<StatefulWidget> createState() => _SshListPageState();
}

class _SshListPageState extends State<SshListPage> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      child: Column(
        children: [
          Row(
            children: [
              CupertinoButton(
                onPressed: () {},
                child: const Text("添加"),
              ),
              SizedBox(
                width: 100.w,
                child: CupertinoTextField(
                  controller: searchTextController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Za-z]'))
                  ],
                ),
              ),
            ],
          ),
          const Text("SSH"),
        ],
      ),
    );
  }
}
