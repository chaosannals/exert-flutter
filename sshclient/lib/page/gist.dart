import 'package:flutter/material.dart';
import 'package:sshclient/page/tool/index.dart';
import 'package:sshclient/page/tool/camera.dart';
import 'package:sshclient/page/tool/microphone_simple.dart';

class GistPage extends StatefulWidget {
  const GistPage({Key? key}) : super(key: key);

  @override
  State<GistPage> createState() => _GistPageState();
}

class _GistPageStorage {
  var tindex = -1;
}

class _GistPageState extends State<GistPage> {
  var _storage = _GistPageStorage();
  final items = [
    ToolItem(Icons.camera),
    ToolItem(Icons.star),
    ToolItem(Icons.star),
    ToolItem(Icons.star),
    ToolItem(Icons.star),
    ToolItem(Icons.star),
  ];

  void switchTool(int index) {
    setState(() {
      _storage.tindex = index;
    });
    PageStorage.of(context)?.writeState(context, _storage);
  }

  @override
  void didChangeDependencies() {
    var ps = PageStorage.of(context)?.readState(context);
    _storage = ps ?? _GistPageStorage();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tools = [
      CameraExampleHome(
        onBack: (v) {
          switchTool(-1);
        },
      ),
      SimpleRecorder(
        onBack: (v) {
          switchTool(-1);
        },
      ),
    ];
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _storage.tindex >= 0
          ? tools[_storage.tindex]
          : ToolIndexPane(items, onClickItem: (i) {
              if (i < tools.length) {
                switchTool(i);
              } else {
                switchTool(-1);
              }
            }),
    );
  }
}
