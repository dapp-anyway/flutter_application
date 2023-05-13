import 'package:flutter/material.dart';
import 'models/wrapper.dart';

// flutter build apk --release --no-sound-null-safety  --build-name=1.0 --build-number=1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}
