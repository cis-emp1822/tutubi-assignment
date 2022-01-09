class CoveredSpace {
  Shape? shape;
  double? xPoint1 = 0;
  double? xPoint2 = 0;
  double? yPoint1 = 0;
  double? yPoint2 = 0;
  CoveredSpace(
      {this.shape = Shape.circle,
      this.xPoint1 = 0,
      this.xPoint2 = 0,
      this.yPoint1 = 0,
      this.yPoint2 = 0});
}

enum Shape { circle, square }
