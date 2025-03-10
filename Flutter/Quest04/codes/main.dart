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
      // 디버그 배너를 제거 (우측 상단 'DEBUG' 표시 안 뜨게 함)
      debugShowCheckedModeBanner: false,
      title: 'Speako Language App',
      // 테마 설정: 기본 색상을 파란색으로 지정하고, 플랫폼에 맞게 밀도 조정.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity:
            VisualDensity.adaptivePlatformDensity, // 플랫폼에 맞춰 밀도를 자동 조정.
      ),
      // 앱이 실행될 때 처음으로 표시될 경로 설정
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
