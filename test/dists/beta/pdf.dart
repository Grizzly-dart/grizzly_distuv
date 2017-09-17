import 'package:test/test.dart';
import 'package:grizzly_scales/grizzly_scales.dart';
import 'package:grizzly_stats/grizzly_stats.dart';

void main() {
  group('Beta', () {
    final beta = new Beta(2.31, 0.627);
    setUp(() {});

    test('pdf', () {
      expect(beta.pdf(0.0), 0);
      expect(beta.pdf(1.0), double.INFINITY);

      final compares = <double>[
        0.0,
        0.0573012531902735,
        0.14845447906987405,
        0.2654017920327192,
        0.40977432960164695,
        0.5875319252917911,
        0.8107861799722151,
        1.1046095168719852,
        1.5305949312569787,
        2.3128861930050384,
      ];

      int i = 0;
      for (double x in Ranger.range(0.0, 0.9, 0.1)) {
        expect(beta.pdf(x), compares[i]);
        i++;
      }
    });

    test('cdf', () {
      expect(beta.cdf(0.0), 0);
      expect(beta.cdf(1.0), 1);

      final compares = <double>[
        0.0,
        0.0024505623324341565,
        0.012517089824453324,
        0.032994839904132885,
        0.06650724501813286,
        0.11605622537630143,
        0.18551735145103485,
        0.28053232507961656,
        0.4107235316211493,
        0.5976936579976497,
      ];

      int i = 0;
      for (double x in Ranger.range(0.0, 0.9, 0.1)) {
        expect(beta.cdf(x), compares[i]);
        i++;
      }

      final compares1 = <double>[
        0.5976936579976497,
        0.6214478124566166,
        0.6465688174461992,
        0.6732703251891985,
        0.7018391840158968,
        0.7326781027112566,
        0.7663877710408484,
        0.8039460320173017,
        0.8471814307707584,
        0.9005435114920721,
      ];

      i = 0;
      for (double x in Ranger.range(0.9, 0.999, 0.01)) {
        expect(beta.cdf(x), compares1[i]);
        i++;
      }
    });

    test('ppf', () {
      expect(beta.ppf(0.0), 0);
      expect(beta.ppf(1.0), 1);

      final compares = <double>[
        0.0,
        0.4713161094085513,
        0.617384140799624,
        0.7171559544920185,
        0.7929069114510491,
        0.852865976189898,
        0.900994595404677,
        0.939377690135841,
        0.9690061942049865,
        0.9899119831235196,
      ];

      int i = 0;
      for (double x in Ranger.range(0.0, 0.9, 0.1)) {
        expect(beta.ppf(x), compares[i]);
        i++;
      }

      final compares1 = <double>[
        0.9899119831235196,
        0.991483202449689,
        0.9929501619669575,
        0.9943086931728518,
        0.9955536588363837,
        0.996678585605038,
        0.9976750539021528,
        0.998531584810656,
        0.9992313001354483,
        0.9997456303513708,
      ];

      i = 0;
      for (double x in Ranger.range(0.9, 0.999, 0.01)) {
        expect(beta.ppf(x), compares1[i]);
        i++;
      }
    });
  });
}
