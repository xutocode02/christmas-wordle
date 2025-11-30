import 'package:flutter/material.dart';
import 'package:wordle/pages/game_page.dart';
import 'package:wordle/pages/home_page.dart';
import 'package:wordle/pages/loss_page.dart';
import 'package:wordle/pages/win_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/gamePage': (context) => const GamePage(),
        '/winPage': (context) => const WinPage(),
        '/lossPage': (context) => const LossPage(),
      },
    );
  }
}
