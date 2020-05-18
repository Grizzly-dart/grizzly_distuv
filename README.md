# DistUV

Dart library to sample univariate random distributions and calculate its statistics.

- [X] Beta
- [X] Binomial
- [X] Cauchy
- [X] Chi-Square
- [X] Exponential
- [X] Gamma
- [X] Geometric
- [X] Normal
- [ ] Pareto
- [X] Student's T
- [X] Uniform
- [ ] Weibull
- [ ] Beta
- [ ] Logistic
- [ ] Log-Normal
- [ ] F
- [ ] Laplace

# Usage

## Statistics of a distribution

```dart
  final beta = Beta(2.31, 0.627);
  print(beta.ppf(0.0));
```

## Sample random number from normal distribution

```dart
  for (int i = 0; i < 100; i++) print(randn);
```

## Sample random number from custom normal distribution

```dart
  final randnCust = normal(loc: 0.5);
  for (int i = 0; i < 100; i++) print(randnCust);
```

# References

- Porting from Golang library [prob](https://github.com/atgjack/prob)