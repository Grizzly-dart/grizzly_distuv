import 'package:test/test.dart';
import 'package:grizzly_range/grizzly_range.dart';
import 'package:grizzly_distuv/grizzly_distuv.dart';

main() {
  group("Student-t", () {
    final t2 = StudentT(2.0);

    test("pdf", () {
      double x1 = -6.9645567187558575, x2 = 6.964556718755855;
      print(x1);
      print(x2);
      // TODO Int1D.
      final x = linspace(x1, x2, 100);
      print(x.toList());
      print(x.length);
      print(x.toList().length);
      List<double> y = x.map(t2.pdf).toList();
      print(y);
      // TODO
    });
  });
}
