import 'package:flutter/material.dart';

class SearchGeneralPage extends StatefulWidget {
  @override
  _SearchGeneralPageState createState() => _SearchGeneralPageState();
}

class _SearchGeneralPageState extends State<SearchGeneralPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _searchController = TextEditingController();

  String _address;

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
        child: Card(
          elevation: 2.0,
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
                        hintStyle: TextStyle(fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        hintText: "Название улицы и номер дома",
                        focusColor: Colors.blue,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,
                                width: 3.00)
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Icon(Icons.add),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),)
        ,
      );
    }

    Widget _buttonDoSearch(void func()) {
      return Material(
          elevation: 1.00,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color.fromRGBO(149, 16, 172, 100),
//      shape: const StadiumBorder(),
          child: InkWell(
              onTap: () {
                setState(() {
                  _address = _searchController.text;
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
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20.0),
      );
    }

    Widget _rowInfo(String title, String val){
      return Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: Row(
          children: <Widget>[
            _textTitleHouseInfo(title),
            SizedBox(
              width: 100,
            ),
            _textTitleHouseInfo(val),
          ],
        )
      );
    }

    Widget _houseInfoBlock(){
      return Container(
        height: 300.0,
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          child: Center(
            child: Card(
              elevation: 10.0,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 50.0),
               child: Column(
                   children: <Widget>[
                     SizedBox(height: 50.0),
                     _rowInfo('Улица', _address),
                   ]
               ),
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
        body: Column(children: <Widget>[
          _searchBlock(() {
            print('debug');
          }),
          _houseInfoBlock(),
        ]));
  }
}
