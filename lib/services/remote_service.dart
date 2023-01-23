import '../models/post.dart';
import '../models/categories.dart';
import 'package:http/http.dart' as http;

import '../models/search.dart';

class RemoteService {
  Future<Post?> getPost({String? category}) async {
    var client = http.Client();

    var uri = category == null
        ? Uri.parse("https://api.chucknorris.io/jokes/random")
        : Uri.parse(
            "https://api.chucknorris.io/jokes/random?category=$category");
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  Future<Search?> getSearch({required String search}) async {
    var client = http.Client();

    var uri = Uri.parse("https://api.chucknorris.io/jokes/search?query=$search");
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return searchFromJson(json);
    }
    return null;
  }

  Future<List<String>?> getCategories() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://api.chucknorris.io/jokes/categories");
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      var json = response.body;
      return categoriesFromJson(json);
    }
    return null;
  }
}
