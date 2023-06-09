import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trip_finder/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode == 200) {
        //correct data
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
    } catch(e) {
      print(e);
    }
    return <DataModel>[];
  }
}