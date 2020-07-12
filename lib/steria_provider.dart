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

  void changeAddress(String address){
    this._currentAddress = address;
    notifyListeners();
  }


  void loadData(){

    this._houseData = HouseData(
        title: 'Test title1',
        architect: 'Architect',
        fullAddress: 'Full address',
        style: 'Style',
        year: 'year'
    );

    notifyListeners();
  }

}
