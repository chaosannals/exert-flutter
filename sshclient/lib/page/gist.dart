import 'package:flutter/material.dart';
import 'package:sshclient/page/tool/filepaths.dart';
import 'package:sshclient/page/tool/images.dart';
import 'package:sshclient/page/tool/index.dart';
import 'package:sshclient/page/tool/camera.dart';
import 'package:sshclient/page/tool/microphone_simple.dart';
import 'package:sshclient/page/tool/videos.dart';
import 'package:sshclient/page/tool/videopage.dart';

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
  final _storageKey = const ValueKey("gist storage");
  final items = [
    ToolItem(Icons.camera),
    ToolItem(Icons.audio_file),
    ToolItem(Icons.file_open_sharp),
    ToolItem(Icons.image_sharp),
    ToolItem(Icons.video_collection),
    ToolItem(Icons.video_call),
  ];

  void switchTool(int index) {
    setState(() {
      _storage.tindex = index;
    });
    PageStorage.of(context)?.writeState(context, _storage, identifier: _storageKey);
  }

  @override
  void didChangeDependencies() {
    var ps = PageStorage.of(context)?.readState(context, identifier: _storageKey);
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
      FilepathsPage(
        onBack: (v) {
          switchTool(-1);
        },
      ),
      ImagesPage(
        onBack: (v) {
          switchTool(-1);
        },
      ),
      VideosPage(
        onBack: (v) {
          switchTool(-1);
        },
      ),
      VideoPage(
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
