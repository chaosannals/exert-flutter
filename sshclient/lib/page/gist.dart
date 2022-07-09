import 'package:flutter/material.dart';
import 'package:sshclient/page/tool/camera.dart';

class GistPage extends StatefulWidget {
  const GistPage({Key? key}) : super(key: key);

  @override
  State<GistPage> createState() => _GistPageState();
}

class _GistPageStorage {
  var isCamera = false;
}

class _GistPageState extends State<GistPage> {
  var _storage = _GistPageStorage();

  void switchCamera(bool v) {
    setState(() {
      _storage.isCamera = v;
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
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _storage.isCamera
          ? CameraExampleHome(
              onBack: (v) {
                switchCamera(false);
              },
            )
          : Wrap(
              alignment: WrapAlignment.center,
              //runAlignment: WrapAlignment.center,
              //crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.camera,
                            size: 50,
                          ),
                          onPressed: () {
                            switchCamera(true);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.grey
                                  : Colors.white;
                            }),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((status) {
                              return status.contains(MaterialState.pressed)
                                  ? Colors.lightBlue
                                  : Colors.blue;
                            }),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
