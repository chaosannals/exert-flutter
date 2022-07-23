import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final ValueChanged<bool>? _onBack;

  const VideoPage({Key? key, ValueChanged<bool>? onBack})
      : _onBack = onBack,
        super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController? controller;

  Future<VideoPlayerController> pick() async {
    var d = await getTemporaryDirectory();
    var i = await d
        .list(recursive: true, followLinks: false)
        .where((i) => i.statSync().type == FileSystemEntityType.file)
        .where((i) => [".mp4"].contains(path.extension(i.path)))
        .first;
    var r = VideoPlayerController.file(File(i.path));
    r.addListener(() {
      setState(() {});
    });
    r.setLooping(true);
    r.initialize().then((_) => setState(() {}));
    return r;
  }

  @override
  void initState() {
    super.initState();
    controller = null;
    pick().then((i) => controller = i);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
              icon: const Icon(Icons.back_hand),
            ),
          ],
        ),
        controller == null
            ? const Text("Loading")
            : !controller!.value.isInitialized
                ? const Text("init...")
                : controller!.value.hasError
                    ? const Text("error")
                    : Expanded(
                        child: ListView(
                          children: [
                            Row(
                              children: [
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
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: controller!.value.aspectRatio,
                              child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: VideoPlayer(controller!)),
                            ),
                          ],
                        ),
                      ),
      ],
    );
  }
}
