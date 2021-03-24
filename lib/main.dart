import 'package:flutter/material.dart';
import 'package:flutter_app_form/screens/transfer/list.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[700],
        accentColor: Colors.tealAccent[700],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          focusColor: Colors.tealAccent[700],
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.tealAccent[700],
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: ListTransfer(),
    );
  }
}
