import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:steriaf/house.dart';


enum StatePage {homePage, errorPage, loadingPage, cardsResults}

class HouseProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _currentAddress;
  String get currentAddress => this._currentAddress;

  HouseData _houseData = HouseData();
  HouseData get houseData => this._houseData;

  bool _isFail = false;
  bool get isFail => this._isFail;

  StatePage _currentState = StatePage.homePage;
  StatePage get currentState => this._currentState;

  TextEditingController _controller = TextEditingController();
  TextEditingController get searchController => this._controller;

  HouseData _selectHouse = HouseData();
  HouseData get selectHouse => this._selectHouse;


  List<HouseData> searchResults = [
    HouseData(
        title: 'Дом мод',
        fullAddress: 'Невский проспект дом 9',
        architect: 'Дядя Федор',
        style: 'Модерн',
        year: '1998'
    ),
    HouseData(
        title: 'Книжный дом',
        fullAddress: 'Невский проспект дом 14',
        architect: 'Владимир Попов',
        style: 'Барокко',
        year: '1886'),
    HouseData(
        title: 'Книжный дом',
        fullAddress: 'Невский проспект дом 15',
        architect: 'Владимир Попов',
        style: 'Барокко',
        year: '1886'),
    HouseData(
        title: 'Книжный дом 4',
        fullAddress: 'Невский проспект дом 16',
        architect: 'Владимир Попов',
        style: 'Барокко',
        year: '1886'
    ),
    HouseData(
        title: 'Книжный дом 5',
        fullAddress: 'Невский проспект дом 17',
        architect: 'Владимир Попов',
        style: 'Барокко',
        year: '1886'
    ),
    HouseData(
        title: 'Книжный дом 6',
        fullAddress: 'Невский проспект дом 18',
        architect: 'Владимир Попов',
        style: 'Барокко',
        year: '1886'
    ),
  ];

  void loadData() async{
    this._currentState = StatePage.loadingPage;
    notifyListeners();

    try {
      this._houseData = await HouseDataLoader().load(_controller.text);
      this._currentState = StatePage.homePage;
    }
    on SteriaBaseException{
      this._currentState = StatePage.errorPage;
    }
    finally{
      this._currentState = StatePage.cardsResults;
      notifyListeners();
    }
  }

  void setState(StatePage statePage){
    this._currentState = statePage;
    notifyListeners();
  }

  void setActiveHouse(HouseData houseData){
    this._selectHouse = houseData;
    notifyListeners();
  }

}
