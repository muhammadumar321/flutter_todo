import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_teal/pages/HomePage.dart';

void main() async {
  initHive();
  runApp(const MyApp());
}

initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('MyTodoBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.grey[300],
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800], // Dark gray AppBar
          foregroundColor: Colors.white, // White text in AppBar
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0x007BFF), // Bright blue buttons
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
