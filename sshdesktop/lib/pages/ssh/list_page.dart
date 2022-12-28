import 'package:flutter/cupertino.dart';
import 'package:sshdesktop/widgets/nav_scaffold.dart';

class SshListPage extends StatefulWidget {
  const SshListPage({super.key});

  @override
  State<StatefulWidget> createState() => _SshListPageState();
}

class _SshListPageState extends State<SshListPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      child: Column(
        children: const [
          Text("SSH"),
        ],
      ),
    );
  }
}
