import 'package:chuck_norris_application/models/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chuck_norris_application/views/home_page.dart';

void main() {
  testWidgets('renders HomePage widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify the presence of specific widgets and texts
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Do you have any idea who Chuck Norris is?'), findsOneWidget);
    expect(find.text('Carlos Ray «Chuck» Norris (born March 10, 1940) is an American martial artist and actor. He is a black belt in Tang Soo Do, Brazilian jiu jitsu and judo.[1] After serving in the United States Air Force, Norris won many martial arts championships and later founded his own discipline Chun Kuk Do. Shortly after, in Hollywood, Norris trained celebrities in martial arts. Norris went on to appear in a minor role in the spy film The Wrecking Crew (1969). Friend and fellow martial artist Bruce Lee invited him to play one of the main villains in Way of the Dragon (1972). While Norris continued acting, friend and student Steve McQueen suggested him to take it seriously. Norris took the starring role in the action film Breaker! Breaker! (1977), which turned a profit. His second lead Good Guys Wear Black (1978) became a hit, and he soon became a popular action film star'), findsOneWidget);

    // // Verify the custom AppBar
    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.text('Chuck Norris Jokes'), findsOneWidget);
  });
}