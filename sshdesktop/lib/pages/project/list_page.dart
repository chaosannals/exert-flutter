import 'package:flutter/cupertino.dart';
import 'package:sshdesktop/widgets/nav_scaffold.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      child: Column(
        children: const [
          Text("Project"),
        ],
      ),
    );
  }
}
