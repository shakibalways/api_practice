import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class MobileModel{
static Future<dynamic> MobileList()async{
  String url =("https://api.restful-api.dev/objects");
  Uri uri = Uri.parse(url);
  var response = await http.get(uri);
  var data = jsonDecode(response.body);
  log("${data[0]['data']['color']}");
  return data;


}

}
