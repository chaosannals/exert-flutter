import 'package:flutter/material.dart';
import 'package:ssh2client/widgets/nav_scaffold.dart';

// class ProjectConfPageArguments {
//   final int id;

//   ProjectConfPageArguments(this.id);
// }

class ProjectConfPage extends StatefulWidget {
  final int id;

  const ProjectConfPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _ProjectConfPageState();
}

class _ProjectConfPageState extends State<ProjectConfPage> {
  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)?.settings.arguments as ProjectConfPageArguments?;

    return NavScaffold(title: "项目 ${widget.id} 配置", body: Column());
  }
}
