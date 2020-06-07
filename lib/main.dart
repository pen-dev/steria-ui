import 'package:flutter/material.dart';
//
//main() => runApp(Steria());

void main() {
  runApp(SteriaApp());
}

class SteriaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Steria",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(title: TextStyle(color: Colors.red)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: HomePage()
    );
  }

}

//class HomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//   return Container(
//     child: TextField(
//         obscureText: false,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: "Введите улице и номер дома",
//         )
//     ),
//   );
//  }
//
//}

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }

}

class StartPageState extends State<SearchPage>{
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
      )
      );
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

class HomePage extends StatelessWidget{
  Size deviceSize;

  HomePage({Key key, this.onPressed}) : super(key: key);

  Widget searchBox() => Padding(
    padding: const EdgeInsets.all(30.0),
    child: Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
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
                    border: InputBorder.none,
                    hintText: "Find our product"
                ),
              ),
            ),
//             Icon(Icons.menu),
          ],
        ),
      ),
    ),
  );

  final GestureTapCallback onPressed;

  Widget searchButton() =>Padding(
      padding: const EdgeInsets.all(30.0),
    child: Material(
      elevation: 10.0,
      color: Colors.transparent,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.yellow,
        child: Ink(
            height: 50.0,
            width: 150.0,
            decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.blue],
                )
            ),
            child: Center(
                child: Text(
                  'Найти',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0),
                )
            )
        )
        )
      )
    );

  Widget combo() => Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      children: <Widget>[
        searchBox(),
        searchButton(),
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              combo(),
            ]
        )
    );
  }
}

//
//return Scaffold(
//body: Stack(
//fit: StackFit.passthrough,
//children: <Widget>[
//searchBox(),
//searchButton(),
//]
//)
//);