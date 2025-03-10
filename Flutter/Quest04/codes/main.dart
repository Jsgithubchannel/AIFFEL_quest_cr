import 'package:flutter/material.dart';
import 'package:speako/screens/lesson_screen.dart';
import 'package:speako/screens/login_screen.dart';
import 'package:speako/screens/start_screen.dart';
import 'package:speako/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speako Language App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/start': (context) => StartScreen(),
        '/lesson': (context) => LessonScreen(),
      },
    );
  }
}
