import 'package:test/test.dart';
import 'package:grizzly_stats/math.dart';

void main() {
	group('Polyval', () {
		test('pdf', () {
			expect(polyval(5, [3, 0, 1]), 76);
			expect(polyval(5, [3, 4, 1]), 96);
		});
	});
}
