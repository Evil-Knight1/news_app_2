import 'package:flutter/material.dart';
import 'package:news_app_2/views/home_view.dart';
import 'package:news_app_2/views/loading_view.dart';

void main() {
  runApp(const NewsApp());
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  // Add other theme properties
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFCDCDCD),
  // Add other theme properties
);

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? darkTheme : lightTheme,
      home:  LoadingView(toggleTheme: _toggleTheme,),
      debugShowCheckedModeBanner: false,
    );
  }
}
