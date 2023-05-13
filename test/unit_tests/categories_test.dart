import 'dart:convert';

import 'package:chuck_norris_application/models/categories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Categories', () {
    test('fromJson() should correctly parse JSON', () {
      final json = ['category1', 'category2', 'category3'];

      final categories = categoriesFromJson(jsonEncode(json));

      expect(categories, ['category1', 'category2', 'category3']);
    });

    test('toJson() should correctly convert to JSON', () {
      final categories = ['category1', 'category2', 'category3'];

      final json = categoriesToJson(categories);

      expect(jsonDecode(json), ['category1', 'category2', 'category3']);
    });
  });
}
