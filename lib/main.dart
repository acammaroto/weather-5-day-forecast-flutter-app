import 'package:flutter/material.dart';
import 'package:techno_weather/view/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SearchView(),
    );
  }
}
