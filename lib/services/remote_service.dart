import '../models/post.dart';
import '../models/categories.dart';
import 'package:http/http.dart' as http;

import '../models/search.dart';

class RemoteService {
  RemoteService({required this.httpClient});

  http.Client httpClient;

  void setHttpClient({required http.Client client}) {
    httpClient = client;
  }

  Future<Post?> getPost({String? category}) async {
    var url = category == null
        ? Uri.parse("https://api.chucknorris.io/jokes/random")
        : Uri.parse(
            "https://api.chucknorris.io/jokes/random?category=$category");

    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }

  Future<Search?> getSearch({required String search}) async {
    var url =
        Uri.parse("https://api.chucknorris.io/jokes/search?query=$search");
    var response = await httpClient.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return searchFromJson(json);
    }
    return null;
  }

  Future<List<String>?> getCategories() async {
    var url = Uri.parse("https://api.chucknorris.io/jokes/categories");
    var response = await httpClient.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return categoriesFromJson(json);
    }
    return null;
  }
}
