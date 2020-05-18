part of grizzly.distuv.dist;

/// The ChiSquared Distribution is a continuous probability distribution
/// with parameters df > 0.
///
/// See: https://en.wikipedia.org/wiki/Chi-squared_distribution
class ChiSquared extends ContinuousRV {
  final double degrees;

  ChiSquared._(this.degrees);

  factory ChiSquared(double degrees) {
    if (degrees <= 0) {
      throw ArgumentError.value(
          degrees, 'degrees', 'Must be greater than zero');
    }
    return ChiSquared._(degrees);
  }

  double mean() => degrees;

  double variance() => 2 * degrees;

  double skewness() => math.pow(2, 1.5) / math.sqrt(degrees);

  double kurtosis() => 3 + (12 / degrees);

  double std() => math.sqrt(2 * degrees);

  double relStd() => math.sqrt(2 / degrees);

  double pdf(double x) {
    if (x < 0) {
      return 0.0;
    }
    if (degrees == 2) {
      return math.exp(-x / 2) / 2;
    }
    double lg = math.lgamma(degrees / 2).lgamma;
    return math.exp((((degrees / 2) - 1) * math.log(x / 2)) - (x / 2) - lg) / 2;
  }

  double cdf(double x) {
    if (x < 0) {
      return 0.0;
    }
    if (degrees == 2) {
      return 1 - math.exp(-x / 2);
    }
    return math.gammaIncLower(degrees / 2, x / 2);
  }

  double ppf(double q) {
    //TODO
    throw UnimplementedError();
  }

  double sample() {
    //TODO
    throw UnimplementedError();
  }

  double sampleMany(int count) {
    //TODO
    throw UnimplementedError();
  }
}
