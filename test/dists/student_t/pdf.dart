import 'package:test/test.dart';
import 'package:grizzly_array/grizzly_array.dart';
import 'package:grizzly_stats/grizzly_stats.dart';

main() {
  group("Student-t", () {
    final t2 = new StudentT(2.0);

    test("pdf", () {
      double x1 = -6.9645567187558575, x2 = 6.964556718755855;
      print(x1);
      print(x2);
      // TODO new Int1D.
      final x = Ranger.linspace(x1, x2, 100);
      print(x.toList());
      print(x.length);
      print(x.toList().length);
      List<double> y = x.map(t2.pdf).toList();
      print(y);
      // TODO
    });
  });
}
