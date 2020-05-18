import 'package:test/test.dart';
import 'package:grizzly_array/grizzly_array.dart';
import 'package:grizzly_distuv/grizzly_distuv.dart';

main() {
  group("Student-t", () {
    final t2 = StudentT(2.0);

    test("ppf", () {
      print(t2.ppf(0.01));
      print(t2.ppf(0.99));
      // TODO
    });
  });
}
