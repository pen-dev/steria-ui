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

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Find our product"),
                ),
              ),
              Icon(Icons.menu),
            ],
          ),
        ),
      ),
    ));
////          TextFormField(
////            validator: (value) {
////              if (value.isEmpty) {
////                return 'Введите название улицы и номер дома';
////              }
////            },
////          ),
////          Padding(
////            padding: const EdgeInsets.symmetric(vertical: 16.0),
////          )
//        ],
//      ),
//    );
  }
}

class HomePage extends StatelessWidget {
  Size deviceSize;

  HomePage({Key key, this.onPressed}) : super(key: key);

  Widget searchBox() => Padding(
//        padding: const EdgeInsets.all(30.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 20.0),
    child: Card(
          elevation: 2.0,
          child: Padding(
//            padding: const EdgeInsets.all(6.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.00),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    onChanged: (String value) {
                      print('Text: $value');
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Название улицы и номер дома"),
                  ),
                ),
//             Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  final GestureTapCallback onPressed;

  Widget searchButton() => Padding(
//      padding: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.00),
      child: Material(
          elevation: 1.00,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color.fromRGBO(149, 16, 172, 100),
//      shape: const StadiumBorder(),
          child: InkWell(
              onTap: () {
                print('debug');
              },
              splashColor: Color.fromRGBO(160, 16, 172, 100),
              child: Ink(
                  height: 50.0,
                  width: 150.0,
                  child: Center(
                      child: Text(
                    'Найти',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  ))))));

  Widget combo() => Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(children: <Widget>[
        searchBox(),
        searchButton(),
      ]));

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(fit: StackFit.passthrough, children: <Widget>[
      combo(),
    ]));
  }
}
