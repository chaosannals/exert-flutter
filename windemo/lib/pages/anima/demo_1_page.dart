import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

// 正弦波时间线
class SinCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}

class AnimaDemo1Page extends StatefulWidget {
  const AnimaDemo1Page({super.key});

  @override
  State<StatefulWidget> createState() => _AnimaDemo1PageState();
}

class _AnimaDemo1PageState extends State<AnimaDemo1Page>
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
    ani.addListener(() {
      setState(() {});
    });

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
            child: Container(
              width: ani.value.w,
              height: ani.value.w,
              transform: Matrix4.rotationZ(ani.value),
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
