import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:chuck_norris_application/views/joke_page.dart';


void main() {
  group('JokePage', () {
    testWidgets('renders CircularProgressIndicator when data is loading',
        (WidgetTester tester) async {
      final httpClient = MockClient((request) async {
        return http.Response(
            '', 404);
      });

      await tester
          .pumpWidget(MaterialApp(home: JokePage(httpClient_: httpClient)));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
