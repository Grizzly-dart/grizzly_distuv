part of grizzly.distuv.dist;

/// The Binomial Distribution is a discrete probability distribution
/// with parameters n > 0, 1 > p > 0.
///
/// See: https://en.wikipedia.org/wiki/Binomial_distribution
class Binomial extends ContinuousRV {
  final double trials;

  final double prob;

  Binomial._(this.trials, this.prob);

  factory Binomial(double trials, double prob) {
    if (trials < 0) {
      throw ArgumentError.value(trials, 'trials', 'Must be positive');
    }

    if (prob < 0 || prob > 1) {
      throw ArgumentError.value(trials, 'trials', 'Must be in range [0, 1]');
    }
    return Binomial._(trials, prob);
  }

  double mean() => trials * prob;

  double variance() => trials * prob * (1 - prob);

  double skewness() => (1 - (2 * prob)) / math.sqrt(trials * prob * (1 - prob));

  double kurtosis() => 3 - (6 / trials) + (1 / (trials * prob * (1 - prob)));

  double std() => math.sqrt(trials * prob * (1 - prob));

  @override
  double relStd() => math.sqrt((1 - prob) / (trials * prob));

  @override
  double pdf(double x) {
    if (x < 0.0 || x > trials) {
      return 0.0;
    }
    x = x.floorToDouble();
    if (prob == 0) {
      if (x == 0) {
        return 1.0;
      }
      return 0.0;
    }
    if (prob == 1) {
      if (x == trials) {
        return 1.0;
      }
      return 0.0;
    }
    final double cnk = math.binomialCoefficient(trials, x);
    final double pows =
        (math.pow(prob, x) * math.pow(1 - prob, trials - x)).toDouble();
    if (cnk.isInfinite) {
      return 0.0;
    }
    return cnk * pows;
  }

  @override
  double cdf(double x) {
    if (x < 0.0) {
      return 0.0;
    }
    if (x > trials) {
      return 1.0;
    }
    double result = 0.0;
    double end = x.floorToDouble() + 1;
    for (double i = 0.0; i < end; i++) {
      final double current = math.binomialCoefficient(trials, i);
      final double pows =
          (math.pow(prob, i) * math.pow(1 - prob, trials - i)).toDouble();
      result += current * pows;
    }
    return result;
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
