import 'package:flutter/material.dart';
import 'articles/article-page.dart';
import 'auth/login-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Article',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/articles",
      routes: {
        "/" : (context) => LoginPage(),
        "/articles" : (context) => ArticlePage()
      },
    );
  }
}