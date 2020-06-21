import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class House{
  String title;
  String architect;
  String address;
//  Boolean isData;

  House({this.title, this.architect, this.address});


  void getHouseData({String address}) async {

//    http.post('http:/
//    http.get('http://0.0.0.0:8000/test',
//        headers: {
////      "Content-Type": "application/json",
//          "Connection":"keep-alive",
//          "Content-Length":"110"}).then((response) => print('${response.statusCode}'));


//    http.get('http://0.0.0.0:8000/address').then((response) => print('test'));
//    http.post('https://5ba6fcf2-0fb1-44c5-be92-e5f83cebd704.mock.pstmn.io/address',
//    encoding: null,
////        headers: { 'Content-Type': 'application/json'},
////        headers: { 'Content-Type': 'text/plain'},
//
//        body:  {'version': '0.1.0'}).then((response) => print(response.statusCode));
////    this.title = response.body;

//    var response = await http.post('https://jsonplaceholder.typicode.com/posts', body: {
//      'title': 'Post 1',
//      'content': 'Lorem ipsum dolor sit amet',
//    });

//
    try{
      var response = await http.get(
          'https://steria.herokuapp.com/v1/house'
      );
      Map<String, dynamic> data = convert.jsonDecode(response.body);
      if (response.statusCode == 200){
        this.architect = data['r_architect'];
      }else{
        this.architect = 'Error';
      }

    }catch(e){
      this.architect = e.toString();

    }








    if (address == 'Обводный'){
      print('ok');
      this.address = address;
//      this.architect =
      this.title = 'Масляный мост';

    }

  }
}