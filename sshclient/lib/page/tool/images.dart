import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImagesPage extends StatefulWidget {
  final ValueChanged<bool>? _onBack;

  const ImagesPage({Key? key, ValueChanged<bool>? onBack})
      : _onBack = onBack,
        super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  Future<List<String>>? items;

  Future<List<String>>? pickItems() async {
    var d = await getTemporaryDirectory();
    return d
        .list(recursive: true, followLinks: false)
        .where((i) => i.statSync().type == FileSystemEntityType.file)
        .where((i) => [".jpg", ".png"].contains(path.extension(i.path)))
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
      mainAxisSize:  MainAxisSize.min,
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
            return Expanded( // TODO ListView 需要靠父级限制宽高。
              // height: 500,
              // width: 500,
              child: ListView.builder(
                shrinkWrap: true,
                //padding: const EdgeInsets.all(20.0),
                itemCount: ps.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  var p = ps[i];
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: Column(
                        children: [
                          Text(p),
                          AspectRatio(
                            aspectRatio: 1.777,
                            child: Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Image.file(File(p)),
                            ),
                          ),
                        ],
                      )
                  );
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
