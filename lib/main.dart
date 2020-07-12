import 'package:flutter/material.dart';
import 'package:steriaf/house.dart';
import 'package:steriaf/searchPage.dart';
import 'package:steriaf/searchPage.dart';

void main() {
  runApp(SteriaApp());
}

class SteriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Steria",
        theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: TextTheme(title: TextStyle(color: Colors.red)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SearchGeneralPage()
    );
  }
}
