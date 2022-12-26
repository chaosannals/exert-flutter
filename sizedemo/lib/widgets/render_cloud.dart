import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RenderCloudParentData extends ContainerBoxParentData<RenderBox> {
  late double width;
  late double height;
  Rect get content => Rect.fromLTWH(
        offset.dx,
        offset.dy,
        width,
        height,
      );
}

class RenderCloudWidget extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RenderCloudParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RenderCloudParentData> {
  double? _ratio;
  double get ratio => _ratio!;
  set ratio(double v) {
    if (_ratio != v) {
      _ratio = v;
      markNeedsPaint();
    }
  }

  bool _needClip = false;

  Clip _overflow;
  Clip get overflow => _overflow;
  set overflow(Clip v) {
    if (_overflow != v) {
      _overflow = v;
      markNeedsPaint();
    }
  }

  RenderCloudWidget({
    List<RenderBox>? children,
    Clip overflow = Clip.none,
    double? ratio,
  })  : _ratio = ratio,
        _overflow = overflow {
    addAll(children);
  }

  bool overlaps(RenderCloudParentData data) {
    Rect rect = data.content;
    RenderBox? child = data.previousSibling;
    if (child == null) {
      return false;
    }
    do {
      RenderCloudParentData childParentData =
          child!.parentData as RenderCloudParentData;
      if (rect.overlaps(childParentData.content)) {
        return true;
      }
      child = childParentData.previousSibling;
    } while (child != null);
    return false;
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! RenderCloudParentData) {
      child.parentData = RenderCloudParentData();
    }
  }

  @override
  void performLayout() {
    _needClip = false;

    if (childCount == 0) {
      size = constraints.smallest;
      return;
    }

    var recordRect = Rect.zero;
    var previousChildRect = Rect.zero;

    RenderBox? child = firstChild;
    while (child != null) {
      var curIndex = -1;
      final RenderCloudParentData childParentData =
          child.parentData as RenderCloudParentData;
      child.layout(constraints, parentUsesSize: true);
      var childSize = child.size;

      childParentData.width = childSize.width;
      childParentData.height = childSize.height;

      do {
        var rX = ratio >= 1 ? ratio : 1.0;
        var rY = ratio <= 1 ? ratio : 1.0;

        var step = 0.02 * pi * 2.0;
        var rotation = 0.0;
        var angle = curIndex * step;
        var angleRadius = 5 + 5 * angle;
        var x = rX * angleRadius * cos(angle + rotation);
        var y = rY * angleRadius * sin(angle + rotation);
        var position = Offset(x, y);

        var childOffset = position - Alignment.center.alongSize(childSize);
        ++curIndex;

        childParentData.offset = childOffset;
      } while (overlaps(childParentData));

      previousChildRect = childParentData.content;
      recordRect = recordRect.expandToInclude(previousChildRect);

      child = childParentData.nextSibling;
    }

    size = constraints
        .tighten(
          height: recordRect.height,
          width: recordRect.width,
        )
        .smallest;

    // 剧中
    var contentCenter = size.center(Offset.zero);
    var recordRectCenter = recordRect.center;
    var transCenter = contentCenter - recordRectCenter;
    child = firstChild;
    while (child != null) {
      final RenderCloudParentData childParentData =
          child.parentData as RenderCloudParentData;
      childParentData.offset += transCenter;
      child = childParentData.nextSibling;
    }

    _needClip =
        size.width < recordRect.width || size.height < recordRect.height;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (!_needClip || _overflow == Clip.none) {
      defaultPaint(context, offset);
    } else {
      context.pushClipRect(
        needsCompositing,
        offset,
        Offset.zero & size,
        defaultPaint,
      );
    }
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

class CloudWidget extends MultiChildRenderObjectWidget {
  final Clip overflow;
  final double ratio;

  CloudWidget({
    super.key,
    super.children,
    this.overflow = Clip.none,
    this.ratio = 1,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCloudWidget(ratio: ratio, overflow: overflow);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderCloudWidget renderObject) {
    renderObject
      ..ratio = ratio
      ..overflow = overflow;
  }
}
