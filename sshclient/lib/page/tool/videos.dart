import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final String vpath;

  const VideoItem(String path, {Key? key}) : vpath = path;

  @override
  State<StatefulWidget> createState() => _VideoItemState(vpath);
}

class _VideoItemState extends State<VideoItem> {
  final String vpath;
  late VideoPlayerController? controller;

  _VideoItemState(String path) : vpath = path;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(File(vpath));
    controller!.addListener(() { setState(() {}); });
    // controller!.setLooping(true);
    controller!.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Text("Loading");
    }
    if (!controller!.value.isInitialized) {
      return const Text("init...");
    }
    if (controller!.value.hasError) {
      return Text("error ${controller!.value.errorDescription}");
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        child: Column(
          children: [
            Text(widget.vpath),
            IconButton(
              onPressed: () {
                if (controller!.value.isPlaying) {
                  controller!.pause();
                } else {
                  controller!.play();
                }
              },
              icon: Icon(controller!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_circle),
            ),
            AspectRatio(
              aspectRatio: 1.777,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: VideoPlayer(controller!),
              ),
            ),
          ],
        ));
  }
}

//----------------------------------------------------------------------

class VideosPage extends StatefulWidget {
  final ValueChanged<bool>? _onBack;

  const VideosPage({Key? key, ValueChanged<bool>? onBack})
      : _onBack = onBack,
        super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  late Future<List<String>>? items;

  Future<List<String>> pickItems() async {
    var d = await getTemporaryDirectory();
    return d
        .list(recursive: true, followLinks: false)
        .where((i) => i.statSync().type == FileSystemEntityType.file)
        .where((i) => [".mp4"].contains(path.extension(i.path)))
        .map((i) => i.path)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    items = pickItems();
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
        FutureBuilder(
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Text("Loading");
            }
            var ps = snapshot.hasData ? snapshot.data! : [];
            return Expanded(
              // TODO ListView 需要靠父级限制宽高。
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ps.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  return VideoItem(ps[i]);
                },
              ),
            );
          },
          future: items,
        ),
      ],
    );
  }
}
