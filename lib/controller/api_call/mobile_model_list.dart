import 'dart:convert';
import 'dart:developer';

import 'package:api_call/model/phone_item_model.dart';
import 'package:http/http.dart' as http;

// class MobileModel {
//   static Future<dynamic> mobileList() async {
//     String url = ("https://api.restful-api.dev/objects");
//     Uri uri = Uri.parse(url);
//     var response = await http.get(uri);
//     var data = jsonDecode(response.body);
//
//    var dataList =
//         data.map((e) => PhoneItemModel.fromJson(e)).toList();
//     log('${dataList.runtimeType}');
//     return dataList;
//
//   }
// }
class ApiService {
 static  Future<List<PhoneItemModel>> mobileList() async {
    final response = await http.get(Uri.parse(
        'https://api.restful-api.dev/objects')); // Use your API URL here

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      var data = jsonList.map((json) => PhoneItemModel.fromJson(json)).toList();
      log("${data.runtimeType}");
      return data;
    } else {
      throw Exception('Failed to load phones');
    }
  }
}
