import 'dart:math';
import 'package:flutter/widgets.dart';

// 配合 CustomMultiChildLayout 使用
class CircleLayoutDelegate extends MultiChildLayoutDelegate {
  final List<String> customLayoutId;
  final Offset center;
  Size? childSize;

  CircleLayoutDelegate(this.customLayoutId,
      {this.center = Offset.zero, this.childSize});

  // 居然通过外部传入 child id 来遍历。
  // 内部是否有获取 children 列表的方法？
  @override
  void performLayout(Size size) {
    for (var item in customLayoutId) {
      if (hasChild(item)) { // LayoutId 的 id
        double r = 100;
        int index = int.parse(item);
        double step = 360 / customLayoutId.length;
        double hd = (2 * pi / 360) * step * index;
        var x = center.dx + sin(hd) * r;
        var y = center.dy - cos(hd) * r;
        childSize ??= Size(size.width / customLayoutId.length,
            size.height / customLayoutId.length);
        layoutChild(item, BoxConstraints.loose(childSize!));
        final double centerX = childSize!.width / 2.0;
        final double centerY = childSize!.height / 2.0;
        var result = Offset(x - centerX, y - centerY);
        positionChild(item, result);
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
