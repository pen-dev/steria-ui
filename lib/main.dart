import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steriaf/pages/error_page.dart';
import 'package:steriaf/pages/loading_page.dart';
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
  
  Widget _get_page_of_state(StatePage statePage){

    switch (statePage){
      case StatePage.loadingPage:
        return LoadingPage();
      case StatePage.errorPage:
        return ErrorPage();
      case StatePage.homePage:
        return MainPage();
      default:
        throw Exception('Error state unknown');
    }
  }
  
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
        home: this._get_page_of_state(context.watch<HouseProvider>().currentState),
    );
  }
}
