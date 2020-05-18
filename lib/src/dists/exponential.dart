part of grizzly.distuv.dist;

/// The Exponential Distribution is a continuous probability distribution
/// with parameters λ > 0.
///
/// See: https://en.wikipedia.org/wiki/Exponential_distribution
class Exponential extends ContinuousRV {
  final double lambda;

  Exponential._(this.lambda);

  factory Exponential(double lambda) {
    if (lambda <= 0) {
      throw ArgumentError.value(
          lambda, 'lambda', 'Must be greater than zero');
    }
    return Exponential._(lambda);
  }

  double mean() => lambda;

  double variance() => lambda * lambda;

  double skewness() => 2.0;

  double kurtosis() => 9.0;

  double std() => lambda;

  @override
  double relStd() => 1.0;

  @override
  double pdf(double x) {
    if (x < 0) {
      return 0.0;
    }
    return math.exp(-1 * x / lambda) / lambda;
  }

  @override
  double cdf(double x) {
    if (x <= 0) {
      return 0.0;
    }
    return 1 - math.exp(-1 * x / lambda);
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
