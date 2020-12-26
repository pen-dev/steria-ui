import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steriaf/pages/main_page.dart';
import 'package:steriaf/steria_provider.dart';


void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HouseProvider())
          ],
          child: SteriaApp()));
}

class SteriaApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    bool _isFail = context.watch<HouseProvider>().isFail;

    return MaterialApp(
      title: "Steria",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(title: TextStyle(color: Colors.red)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/houseInfo': (context) => MainPage(),
      },
    );
  }
}
