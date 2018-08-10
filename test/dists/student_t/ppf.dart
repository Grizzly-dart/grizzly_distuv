import 'package:test/test.dart';
import 'package:grizzly_array/grizzly_array.dart';
import 'package:grizzly_stats/grizzly_stats.dart';

main() {
  group("Student-t", () {
    final t2 = new StudentT(2.0);

    test("ppf", () {
      print(t2.ppf(0.01));
      print(t2.ppf(0.99));
      // TODO
    });
  });
}
