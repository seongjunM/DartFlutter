class Point {
  var x;
  var y;

  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
  }

  String get stringfy => "(${this.x}, ${this.y})";
}

class Rational {
  var numerator;
  var denominator;
  // Default Constructor.
  Rational([var numerator = 0, var denominator = 1]);

  Rational.from(var numerator, var denominator) {
    if (numerator is! num || denominator is! num)
      throw ArgumentError('Input must be num');
    if (denominator == 0) throw ArgumentError('Denominator cannot be 0');
    if (numerator * denominator < 0) {
      this.numerator = -numerator.abs();
      this.denominator = denominator.abs();
    } else
      this.numerator = numerator.abs();
    this.denominator = denominator.abs();
  }

  static int gcd(int a, int b) {
    while (b != 0) {
      final t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  Rational _reduce() {
    int g = Rational.gcd(numerator.abs(), denominator.abs());
    int n = numerator ~/ g;
    int d = denominator ~/ g;
    if (d < 0) {
      n = -n;
      d = -d;
    }
    return Rational.from(n, d);
  }

  String toString() => 'numerator / denominator: ${numerator} / ${denominator}';

  Rational operator *(Rational other) {
    var out_numerator = this.numerator * other.numerator;
    var out_denominator = this.denominator * other.denominator;
    return Rational(out_numerator, out_denominator)._reduce();
  }

  Rational operator /(Rational other) {
    var out_numerator = this.numerator * other.denominator;
    var out_denominator = this.denominator * other.numerator;
    return Rational(out_numerator, out_denominator)._reduce();
  }
}

void main() {}
