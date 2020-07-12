import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:steriaf/house.dart';


class HouseProvider with ChangeNotifier, DiagnosticableTreeMixin {
  HouseData _houseData;
  HouseData get houseData => this._houseData;

  bool _isFail = false;
  bool get isFail => this._isFail;

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
