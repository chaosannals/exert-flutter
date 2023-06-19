class SwordFlowPainter extends CustomPainter {
  Paint myPaint = Paint()
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeJoin = StrokeJoin.bevel
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    Path myPath = Path();
    double w = size.width;
    double h = size.height;
    double topH = h * 0.92;
    myPath.moveTo(0, h / 2);
    myPath.cubicTo(0, topH * 3 / 4, w / 4, topH, w / 2, topH);
    myPath.cubicTo((3 * w) / 4, topH, w, topH * 3 / 4, w, h / 2);
    myPath.cubicTo(w, h * 3 / 4, 3 * w / 4, h, w / 2, h);
    myPath.cubicTo(w / 4, h, 0, h * 3 / 4, 0, h / 2);

    canvas.drawPath(myPath, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
