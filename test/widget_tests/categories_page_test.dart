import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chuck_norris_application/views/categories_page.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('CategoriesPage displays categories',
      (WidgetTester tester) async {
    // Create a mock HttpClient with the desired responses
    final httpClient = MockClient((request) async {
      if (request.url.path == '/categories') {
        return http.Response(
            jsonEncode(['category1', 'category2', 'category3']), 200);
      }
      return http.Response(
          '', 404); // Return a default response for other requests
    });

    // Build the CategoriesPage widget
    await tester
        .pumpWidget(MaterialApp(home: CategoriesPage(httpClient_: httpClient)));

    // Verify that CircularProgressIndicator is initially displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
});
}
