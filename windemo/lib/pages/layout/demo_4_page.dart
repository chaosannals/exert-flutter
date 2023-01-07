import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo4Page extends StatefulWidget {
  const LayoutDemo4Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo4PageState();
}

class _LayoutDemo4PageState extends State<LayoutDemo4Page> {
  final _numbers = List<int>.generate(10, (i) => i + 1);
  final _controller = ScrollController();
  var isShowTag = false;
  var _process = 0.0;

  void _loadNumbers() {
    Future.delayed(const Duration(seconds: 1)).then((e) {
      setState(() {
        _numbers.insertAll(
          _numbers.length - 1,
          List<int>.generate(10, (i) => i + 1).toList(),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadNumbers();
    _controller.addListener(() {
      if (_controller.offset < 400.h && isShowTag) {
        setState(() {
          isShowTag = false;
        });
      } else if (_controller.offset >= 400.h && !isShowTag) {
        setState(() {
          isShowTag = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Row(
        children: [
          // builder 示例
          Expanded(
            flex: 1,
            child: ListView.builder(
              // prototypeItem itemExtent 二选一
              prototypeItem: const Text("111"), // 用来测算单项大小的原型组件。
              // itemExtent: 50.0, // 直接指定高度，这个写死了，用 prototypeItem 可以测算。
              itemCount: 100,
              controller: _controller,
              itemBuilder: (context, index) {
                return Text("${isShowTag ? '!!!!' : ''} no: $index");
              },
            ),
          ),
          // children 示例
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.w),
              children: List<int>.generate(20, (i) => i + 1).map((i) {
                return Text(
                  "No: $i",
                  textScaleFactor: 2.0,
                );
              }).toList(),
            ),
          ),
          // 间隔示例
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) {
                var tail = _numbers.length - 1;
                if (i == tail) {
                  _loadNumbers();
                }
                return Text("no: $i => ${_numbers[i]}");
              },
              separatorBuilder: (context, i) {
                return Divider(color: i % 2 == 0 ? Colors.blue : Colors.red);
              },
              itemCount: _numbers.length,
            ),
          ),
          // 监听示例
          Expanded(
            child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  setState(() {
                    _process = notification.metrics.pixels /
                        notification.metrics.maxScrollExtent;
                  });
                  return false; // 如果为 true 进度条失效。
                },
                child: Column(
                  children: [
                    Text("$_process"),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10.w),
                        children: List<int>.generate(100, (i) => i + 1).map((i) {
                          return Text(
                            "No: $i",
                            textScaleFactor: 2.0,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
