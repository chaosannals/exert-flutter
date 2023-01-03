import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

// 这个是 Flutter 提供的封装类，感觉总体代码没变少啊。。。
// 应该是提倡把动画独立封装出来不要直接写组件里面。
class _TurnRect extends AnimatedWidget {
  const _TurnRect({
    super.key,
    required super.listenable,
  });

  @override
  Widget build(BuildContext context) {
    final ani = listenable as Animation<double>;
    return Container(
      width: ani.value.w,
      height: ani.value.w,
      transform: Matrix4.rotationZ(ani.value),
      color: Colors.cyan,
    );
  }
}

class AnimaDemo2Page extends StatefulWidget {
  const AnimaDemo2Page({super.key});

  @override
  State<StatefulWidget> createState() => _AnimaDemo2PageState();
}

class _AnimaDemo2PageState extends State<AnimaDemo2Page>
    with SingleTickerProviderStateMixin {
  late Animation<double> ani;
  late AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    ani = Tween(begin: 0.0, end: 140.0).animate(aniController);

    // AnimationWeight 和 AnimationBuild 都不需要在外部添加此项。
    // 继承的时候已经封装了。
    // ani.addListener(() {
    //   setState(() {});
    // });

    // 开启动画
    aniController.forward();
  }

  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  aniController.reset();
                  aniController.forward();
                },
                child: const Text("开始"),
              ),
            ],
          ),
          Center(
            child: _TurnRect(listenable: ani),
          ),
        ],
      ),
    );
  }
}
