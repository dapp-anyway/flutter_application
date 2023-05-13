import 'package:chuck_norris_application/models/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testing Post', () {
    test("when initialise then update data #1", () {
      final post = Post(value: "value");
      final value = post.value;
      expect(value, "value");
    });

    test("when initialise then update data #2", () {
      final post = Post(value: "value", id: "1");
      final value = post.value;
      expect(value, "value");
      final id = post.id;
      expect(id, "1");
    });

    test("when initialise then update data #3", () {
      final post = Post(
          value: "value", id: "1", categories: [], iconUrl: "url", url: "url");
      final value = post.value;
      expect(value, "value");
      final id = post.id;
      expect(id, "1");
      final categories = post.categories;
      expect(categories, []);
      final iconUrl = post.iconUrl;
      expect(iconUrl, "url");
      final url = post.url;
      expect(url, "url");
    });

    test("when parse json then update data", () {
      final post = Post.fromJson({
        "categories": [],
        "created_at": "2020-01-05 13:42:21.179347",
        "icon_url": "url",
        "updated_at": "2020-01-05 13:42:21.179347",
        "url": "url",
        "value": "value"
      });
      final categories = post.categories;
      expect(categories, []);
      final createdAt = post.createdAt;
      expect(createdAt, DateTime.parse("2020-01-05 13:42:21.179347"));
      final updatedAt = post.updatedAt;
      expect(updatedAt, DateTime.parse("2020-01-05 13:42:21.179347"));
      final iconUrl = post.iconUrl;
      expect(iconUrl, "url");
      final url = post.url;
      expect(url, "url");
      final value = post.value;
      expect(value, "value");
    });

    test("when creating json from post then returns json", () {
      final post = Post(value: "value");
      final json = post.toJson();
      expect(json, {
        "value": "value",
        "categories": [],
        "created_at": "",
        "icon_url": "",
        "id": "",
        "updated_at": "",
        "url": ""
      });
    });
  });
}
