part of grizzly.distuv.dist;

/// The Normal(or Gaussian) Distribution is a continuous probability distribution
/// with parameters μ, σ >= 0.
///
/// See: https://en.wikipedia.org/wiki/Normal_distribution
class Normal extends ContinuousRV {
  final double mu;

  final double sigma;

  Normal._(this.mu, this.sigma);

  factory Normal(double mu, double sigma) {
    if (sigma < 0) {
      throw ArgumentError.value(sigma, 'sigma', 'Must be greater than zero');
    }
    return Normal._(mu, sigma);
  }

  double mean() => mu;

  double variance() => sigma * sigma;

  double skewness() => 0.0;

  double kurtosis() => 3.0;

  double std() => sigma;

  double relStd() => sigma / mu;

  double pdf(double x) {
    final double diff = x - mu;
    final double expo = -1 * diff * diff / (2 * variance());
    final double denom = math.sqrt(2 * variance() * math.pi);
    return math.exp(expo) / denom;
  }

  double cdf(double x) {
    final double inner = 1 + math.erf((x - mu) / (sigma * math.sqrt(2)));
    return inner.abs() / 2;
  }

  double ppf(double q) => math.normalInv(q);

  double sample() {
    //TODO
    throw UnimplementedError();
  }

  double sampleMany(int count) {
    //TODO
    throw UnimplementedError();
  }
}
