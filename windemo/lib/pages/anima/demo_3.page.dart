import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class _GrowTransition extends StatelessWidget {
  final Widget? child;
  final Animation<double> animation;

  const _GrowTransition({super.key, required this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: animation.value.w,
            height: animation.value.w,
            transform: Matrix4.rotationZ(animation.value),
            color: Colors.cyan,
            child: child,
          );
        },
      ),
    );
  }
}

class AnimaDemo3Page extends StatefulWidget {
  const AnimaDemo3Page({super.key});

  @override
  State<StatefulWidget> createState() => _AnimaDemo3PageState();
}

class _AnimaDemo3PageState extends State<AnimaDemo3Page>
    with SingleTickerProviderStateMixin {
  late String? tip;
  late Animation<double> animation;
  late AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 140.0).animate(aniController);

    // 监听动画的状态。
    animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          aniController.reverse();
          break;
        case AnimationStatus.dismissed:
          aniController.forward();
          break;
        case AnimationStatus.forward:
          setState(() {
            tip = 'forward';
          });
          break;
        case AnimationStatus.reverse:
          setState(() {
            tip = 'reverse';
          });
          break;
      }
    });

    // 开启动画
    aniController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("tip: $tip"),
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
            child: _GrowTransition(
              animation: animation,
              child: const Text("Grow"),
            ),
          ),
        ],
      ),
    );
  }
}
