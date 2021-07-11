import 'package:flutter/material.dart';
import 'package:cashflow_tracker/screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashflow',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainScreen(),
    );
  }
}
