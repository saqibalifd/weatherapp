import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontWeight: FontWeight.w400),
            titleMedium: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        home: HomeScreen());
  }
}
