import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:steriaf/house.dart';


enum StatePage {homePage, errorPage, loadingPage}

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

  void loadData() async{
    this._currentState = StatePage.loadingPage;
    notifyListeners();

    if (_controller.text != '') {
      try {
        this._houseData = await HouseDataLoader().load(_controller.text);
        this._currentState = StatePage.homePage;
      }
      on SteriaBaseException {
        this._currentState = StatePage.errorPage;
      }
      finally {
        notifyListeners();
      }
    } else {
      this._currentState = StatePage.errorPage;
      notifyListeners();
    }

  }

}
