part of grizzly.distuv.dist;

/// The Gamma Distribution is a continuous probability distribution
/// with parameters α > 0, β > 0.
///
/// See: https://en.wikipedia.org/wiki/Gamma_distribution
class Gamma extends ContinuousRV {
  final double shape;

  final double rate;

  Gamma._(this.shape, this.rate);

  factory Gamma(double shape, double rate) {
    if (shape <= 0) {
      throw ArgumentError.value(
          shape, 'shape', 'Must be greater than zero');
    }
    if (rate <= 0) {
      throw ArgumentError.value(rate, 'rate', 'Must be greater than zero');
    }
    return Gamma._(shape, rate);
  }

  double mean() => shape / rate;

  double variance() => shape / (rate * rate);

  double skewness() => 2 / math.sqrt(shape);

  double kurtosis() => 6 / shape;

  double std() => math.sqrt(shape / (rate * rate));

  @override
  double relStd() => 1 / math.sqrt(shape);

  @override
  double pdf(double x) {
    if (x < 0) {
      return 0.0;
    }
    if (x == 0) {
      if (shape == 1) {
        return rate;
      }
      return 0.0;
    }
    if (shape == 1) {
      return math.exp((-1 * x) * rate) * rate;
    }
    double first = (shape - 1) * math.log(x * rate) - (x * rate);
    double lgamma = math.lgamma(shape).lgamma;
    return math.exp(first - lgamma) * rate;
  }

  @override
  double cdf(double x) {
    if (x <= 0) {
      return 0.0;
    }
    return math.gammaIncLower(shape, x * rate);
  }

  double ppf(double q) {
    //TODO
    throw UnimplementedError();
  }

  @override
  double sample() {
    //TODO return min + (rand.Float64() * (max - min));
    throw UnimplementedError();
  }

  double sampleMany(int count) {
    //TODO
    throw UnimplementedError();
  }
}
