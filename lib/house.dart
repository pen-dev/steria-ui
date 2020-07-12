import 'dart:convert' as convert;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class House{
  String title;
  String architect;
  String fullAddress;
  String style;
  String year;
//  Boolean isData;
  bool isFail = false;
  bool isLoading = false;

  House({this.title, this.architect, this.fullAddress, this.style, this.year});

  String _url = 'https://steria.herokuapp.com/v1/house';


  void getHouseData(State page, {String address}) async {
    print('start');

    this.isFail = false;
    this.isLoading = true;

    var response = await http.get(
      '$_url?address=$address',
    );
    Map<String, dynamic> data = convert.jsonDecode(response.body);
    print('$data');

    if (response.statusCode == 200) {
      this.title = data['r_name'].toString();
      this.architect = data['r_architect'].toString();
      this.year = data['r_years_string'].toString();
      this.style = data['r_style'].toString();
      this.fullAddress = data['r_adress'].toString();
      
    } else {
      this.isFail = true;

    }

    this.isLoading = false;
    page.setState(() {});

  }
}

//class HouseDataLoader {
//
//}


class HouseData{
  String title;
  String architect;
  String fullAddress;
  String style;
  String year;

  HouseData({
    @required this.title,
    @required this.architect,
    @required this.fullAddress,
    @required this.style,
    @required this.year
});
}