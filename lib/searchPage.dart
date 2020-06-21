import 'package:flutter/material.dart';
import 'package:steriaf/house.dart';

class SearchGeneralPage extends StatefulWidget {
  @override
  _SearchGeneralPageState createState() => _SearchGeneralPageState();
}

class _SearchGeneralPageState extends State<SearchGeneralPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _searchController = TextEditingController();

  String _address;
  House _houseInfo = House(title: '', architect: '', address: '');

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _inputSearch(TextEditingController controller) {
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
                    controller: controller,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    onChanged: (String value) {
                      print('Text: $value');
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 20,
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

    Widget _buttonDoSearch(void func()) {
      return Material(
          elevation: 1.00,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(149, 16, 172, 100),
//      shape: const StadiumBorder(),
          child: InkWell(
              onTap: () {
                setState(() {
//                  _houseInfo.address = _searchController.text;
                  _houseInfo.getHouseData(address: _searchController.text);
                });
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
                      )
                  )
              )
          )
      );
    }
    void _searchHouse() {
      _address = _searchController.text;
//      _searchController.clear();
      print('Text: $_address');
    }

    Widget _searchBlock(void func()) {
      return Container(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: _inputSearch(_searchController),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 20.0, left: 10.0, right: 10.0),
                  child: _buttonDoSearch(_searchHouse),
                ),
              ]
          )
      );
    }

    Widget _resultText() {
      print('address: $_address');
      return Padding(
        padding: EdgeInsets.only(bottom: 10.9),
        child: Text(
          _address,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20.0),
        ),
      );
    }

    Widget _textTitleHouseInfo(String txt){
      return Text(
        txt,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 14.0),
      );
    }

    Widget _textTitleHouseInfo2(String txt){
      return Text(
        txt,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(160, 16, 172, 100),
            fontWeight: FontWeight.normal,
            fontSize: 14.0),
      );
    }


    Widget _rowInfo(String title, String val){
      return Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Row(
          children: <Widget>[
            SizedBox(
                width: 100,
                child: _textTitleHouseInfo(title)),
            SizedBox(
              width: 30,
            ),
            SizedBox(
                width: 100,
                child : _textTitleHouseInfo2(val)),
          ],
        )
      );
    }

    Widget _rowTitle(String title){
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0),
          )
          ]
        )
      );
    }

    Widget _houseInfoBlock(){
      return Container(
        height: 400.0,
        child: Center(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    _rowTitle(this._houseInfo.title),
                    SizedBox(height: 10.00),
                    _rowInfo('Архитекторы:', this._houseInfo.architect),
                    SizedBox(height: 4.00),
                    _rowInfo('Год постройки:', '1960-1964'),
                    SizedBox(height: 4.00),
                    _rowInfo('Стиль:', 'Современный'),
                  ]
              ),
            ),
          ),
        )
      );
    }

    if (_address == null) {
      _address = 'test';
    }
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: Padding(
          padding:  EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            _searchBlock(() {
              print('debug');
            }),
//            if
            _houseInfoBlock(),
          ]),
        ));
  }
}
