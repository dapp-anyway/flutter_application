import 'package:chuck_norris_application/models/search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Search', () {
    test('fromJson() should correctly parse JSON', () {
      final json = {
        "total": 2,
        "result": [
          {
            "categories": ["category1", "category2"],
            "created_at": "2023-05-12T10:30:00",
            "icon_url": "https://example.com/icon.png",
            "id": "1",
            "updated_at": "2023-05-12T15:45:00",
            "url": "https://example.com",
            "value": "Some value"
          }
        ]
      };

      final search = Search.fromJson(json);

      expect(search.total, 2);
      expect(search.result.length, 1);

      final result = search.result[0];
      expect(result.categories, ["category1", "category2"]);
      expect(result.createdAt, DateTime.parse("2023-05-12T10:30:00"));
      expect(result.iconUrl, "https://example.com/icon.png");
      expect(result.id, "1");
      expect(result.updatedAt, DateTime.parse("2023-05-12T15:45:00"));
      expect(result.url, "https://example.com");
      expect(result.value, "Some value");
    });

    test('toJson() should correctly convert to JSON', () {
      final result = Result(
        categories: ["category1", "category2"],
        createdAt: DateTime.parse("2023-05-12T10:30:00.000"),
        iconUrl: "https://example.com/icon.png",
        id: "1",
        updatedAt: DateTime.parse("2023-05-12T15:45:00.000"),
        url: "https://example.com",
        value: "Some value",
      );

      final json = result.toJson();

      expect(json["categories"], ["category1", "category2"]);
      expect(json["created_at"], "2023-05-12T10:30:00.000");
      expect(json["icon_url"], "https://example.com/icon.png");
      expect(json["id"], "1");
      expect(json["updated_at"], "2023-05-12T15:45:00.000");
      expect(json["url"], "https://example.com");
      expect(json["value"], "Some value");
    });
  });
}
