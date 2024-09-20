import 'dart:ui';

enum PenColors {
  black(Color(0xff000000)),
  blue(Color(0xff0000ff)),
  red(Color(0xffff0000)),
  green(Color(0xff008000));

  final Color color;

  const PenColors(this.color);
}

enum PenStroke {
  fine(1),
  medium(2),
  bold(3);

  final int stroke;

  const PenStroke(this.stroke);
}
