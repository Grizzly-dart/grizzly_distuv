import 'dart:math';

abstract class RandSampler {
  static UniformSampler uniform = UniformSampler(uniform: _state);

  static StandardNormalSampler standardNormal =
      StandardNormalSampler(uniform: _state);

  static NormalSampler normal = NormalSampler(uniform: _state);

  static StandardExponentialSampler standardExponential =
      StandardExponentialSampler(uniform: _state);

  static ExponentialSampler exponential = ExponentialSampler(uniform: _state);

  static Random _state = Random.secure();
}

double get rand => RandSampler.uniform.sample;

double get randn => RandSampler.standardNormal.sample;

double normal({num loc: 0, num scale: 1}) =>
    RandSampler.normal.sample(loc: loc, scale: scale);

double get standardExponential => RandSampler.standardExponential.sample;

double exponential({num scale: 1.0}) =>
    RandSampler.exponential.sample(scale: scale);

class UniformSampler implements RandSampler {
  /// Uniform distribution used internally to generate normal samples
  final Random _uniform;

  UniformSampler({Random? uniform}) : _uniform = uniform ?? RandSampler._state;

  int get sampleInt => _uniform.nextInt(1 << 32);

  double get sample => _uniform.nextDouble();
}

class StandardNormalSampler implements RandSampler {
  /// Uniform distribution used internally to generate normal samples
  final Random _uniform;

  /// If true, [_gauss] contains a gaussian deviate
  bool _hasGauss = false;

  double _gauss = 0.0;

  StandardNormalSampler({Random? uniform})
      : _uniform = uniform ?? RandSampler._state;

  double get sample {
    if (_hasGauss) {
      final double tmp = _gauss;
      _gauss = 0.0;
      _hasGauss = false;
      return tmp;
    } else {
      double x1, x2, r2;

      do {
        x1 = 2.0 * _uniform.nextDouble() - 1.0;
        x2 = 2.0 * _uniform.nextDouble() - 1.0;
        r2 = x1 * x1 + x2 * x2;
      } while (r2 >= 1.0 || r2 == 0.0);

      // Box-Muller transform
      final double f = sqrt(-2.0 * log(r2) / r2);
      // Keep for next call
      _gauss = f * x1;
      _hasGauss = true;
      return f * x2;
    }
  }
}

class NormalSampler implements RandSampler {
  final StandardNormalSampler _internal;

  NormalSampler({Random? uniform})
      : _internal = uniform != null
            ? StandardNormalSampler(uniform: uniform)
            : RandSampler.standardNormal;

  double sample({num loc: 0, num scale: 1}) => loc + scale * _internal.sample;
}

class StandardExponentialSampler implements RandSampler {
  /// Uniform distribution used internally to generate exponential samples
  final Random _uniform;

  StandardExponentialSampler({Random? uniform})
      : _uniform = uniform ?? RandSampler._state;

  double get sample => -log(1.0 - _uniform.nextDouble());
}

class ExponentialSampler implements RandSampler {
  /// Uniform distribution used internally to generate exponential samples
  final Random _uniform;

  ExponentialSampler({Random? uniform})
      : _uniform = uniform ?? RandSampler._state;

  double sample({num scale: 1.0}) => scale * -log(1.0 - _uniform.nextDouble());
}
