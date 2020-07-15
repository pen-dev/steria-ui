import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steriaf/house.dart';
import 'package:steriaf/steria_provider.dart';


class SearchFieldWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = context.watch<HouseProvider>()
        .searchController;

    return Container(
      height: 60,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        child: Padding(
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
                  controller: _controller,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    hintText: "Название улицы и номер дома",
                    focusColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}


class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Material(
          elevation: 1.00,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(149, 16, 172, 100),
          child: InkWell(
              onTap: () => context.read<HouseProvider>().loadData(),
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
                            fontSize: 18.0),
                      )
                  )
              )
          )
      ),
    );
  }
}

class SearchBlockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: SearchFieldWidget(),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 20.0,
                    left: 10.0,
                    right: 10.0
                ),
                child: ButtonWidget(),
              ),
            ]
        )
    );
  }
}


class CardWidget extends StatelessWidget {
  final Widget child;

  CardWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        child: Center(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            child: this.child,
          ),
        )
    );
  }
}

class HouseCardInfoWidget extends StatelessWidget {

  Widget _wrapTextRow(String text){
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 14.0),
    );
  }

  Widget _wrapRow(String leftText, String rightText){
    return Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 100,
                child: this._wrapTextRow(leftText)),
            SizedBox(
              width: 30,
            ),
            SizedBox(
                width: 100,
                child : this._wrapTextRow(rightText)),
          ],
        )
    );

  }

  @override
  Widget build(BuildContext context) {

    HouseData _data = context.watch<HouseProvider>().houseData;

    return CardWidget(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 8),
                Column(
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text(
                        '${_data.title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0),
                      )
                    ]),
            SizedBox(height: 10.00),
                this._wrapRow('Архитекторы:', '${_data.architect}'),
                SizedBox(height: 4.00),
                this._wrapRow('Год постройки:', '${_data.year}'),
                SizedBox(height: 4.00),
                this._wrapRow('Стиль:', '${_data.style}'),
              ]
          ),
        ),
      ),
    );
  }
}


class ErrorCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 10,),
                Text(
                  'Упс. Попробуйте другой адрес.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                ),
              ],
            )
        ),
      ),
    );
  }
}


class LoadingCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
                height: 20
            ),
            Text(
              'Поиск...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}


class VersionInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                InkWell(
                  child: Text(
                    'v0.1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                  ),
                ),
              ],
            )
        )
    );
  }
}





