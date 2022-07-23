import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sshclient/common.dart';

class FilepathsPage extends StatefulWidget {
  final ValueChanged<bool>? _onBack;

  const FilepathsPage({Key? key, ValueChanged<bool>? onBack})
      : _onBack = onBack,
        super(key: key);

  @override
  State<FilepathsPage> createState() => _FilepathsPageState();
}

class _FilepathsPageState extends State<FilepathsPage> {
  ScrollController _controller = ScrollController();
  Future<Directory?>? tempDir;
  Future<Directory?>? appDocDir;
  Future<Directory?>? appSupDir;

  @override
  void initState() {
    super.initState();
    tempDir = getTemporaryDirectory();
    appDocDir = getApplicationDocumentsDirectory();
    appSupDir = getApplicationSupportDirectory();

    //Log.i("init read:  temp: ${tempDir?.path}  doc: ${appDocDir?.path}  sup: ${appSupDir?.path}");
    Log.i("init filepahts");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  widget._onBack?.call(true);
                },
                icon: const Icon(Icons.back_hand)),
          ],
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          controller: _controller,
          children: <Widget>[
            Row(
              children: [
                const Text("temp dir: "),
                FutureBuilder(
                  builder: (context, AsyncSnapshot<Directory?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data!.path);
                      } else {
                        return const Text("路径不存在。");
                      }
                    }
                    return const Text("");
                  },
                  future: tempDir,
                ),
              ],
            ),
            Row(
              children: [
                const Text("doc dir: "),
                FutureBuilder(
                  builder: (context, AsyncSnapshot<Directory?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data!.path);
                      } else {
                        return const Text("路径不存在。");
                      }
                    }
                    return const Text("");
                  },
                  future: appDocDir,
                ),
              ],
            ),
            Row(
              children: [
                const Text("support dir: "),
                FutureBuilder(
                  builder: (context, AsyncSnapshot<Directory?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data!.path);
                      } else {
                        return const Text("路径不存在。");
                      }
                    }
                    return const Text("");
                  },
                  future: appSupDir,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
