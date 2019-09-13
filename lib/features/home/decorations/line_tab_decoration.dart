import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LineTabDecoration extends Decoration {
  final Color color;

  LineTabDecoration({@required this.color});

  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final LineTabDecoration decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = decoration.color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    final difference = (rect.right - rect.left) / 2;

    final dx = rect.right - difference;
    final dy = rect.height / 5;

    final Offset startOffset = Offset(dx, dy);
    final Offset endOffset = Offset(dx, -dy);

    canvas.drawLine(startOffset, endOffset, paint);
  }
}
