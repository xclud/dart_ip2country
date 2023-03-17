import 'package:ip2country/ip2country.dart';
import 'package:test/test.dart';

void main() {
  test('Lookup Test', () {
    expect(lookup('2.191.245.22'), 'IR');
    expect(lookup('209.142.68.29'), 'US');
    expect(lookup('69.162.81.155'), 'US');
    expect(lookup('192.199.248.75'), 'US');
  });
}
