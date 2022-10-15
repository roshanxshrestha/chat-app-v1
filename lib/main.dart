import 'package:chat_app_v1/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "message app ui",
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.black87,
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     secondary: Colors.black54,
      //   ),
      // ),
      home: HomeScreen(),
    );
  }
}
