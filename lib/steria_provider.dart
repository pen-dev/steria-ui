import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:steriaf/house.dart';


class HouseProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _currentAddress;
  String get currentAddress => this._currentAddress;

  HouseData _houseData = HouseData();
  HouseData get houseData => this._houseData;

  bool _isFail = false;
  bool get isFail => this._isFail;

  TextEditingController _controller = TextEditingController();
  TextEditingController get searchController => this._controller;

  void loadData() async{
    this._isFail = false;

    try {
      this._houseData = await HouseDataLoader().load(_controller.text);
    }
    on SteriaBaseException{
      this._isFail = true;
    }

    notifyListeners();
  }

}
