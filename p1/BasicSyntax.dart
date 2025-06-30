class Point {
  var x;
  var y;

  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
  }

  String get stringfy => "(${this.x}, ${this.y})";
}

void main() {}
