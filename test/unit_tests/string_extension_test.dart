import 'package:chuck_norris_application/services/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testing StringExtension.capitalize', () {
    test('when first capital', () {
      final result = StringExtension.capitalize("Sample text");
      expect(result, equals("Sample text"));
    });

    test('when all capital', () {
      final result = StringExtension.capitalize("SAMPLE TEXT");
      expect(result, equals("Sample text"));
    });

    test('when all lowercase', () {
      final result = StringExtension.capitalize("sample text");
      expect(result, equals("Sample text"));
    });

    test('when Null then empty string', () {
      final result = StringExtension.capitalize(null);
      expect(result, "");
    });
  });
}
