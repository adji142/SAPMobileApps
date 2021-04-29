import 'package:http/http.dart' as http;
import 'dart:convert';
class htest {
  Future<Map> getData() async{
    // var url = 'http://192.168.1.66:8888/WebSDK/read.aspx';
    var url = 'http://180.246.205.240:11422/WebSDK/read.aspx';
    final response = await http.post(url);  
    return json.decode(response.body);
  }
  Future<Map> exec() async{
    var url = 'http://180.246.205.240:11422/WebSDK/execute.aspx';
    final response = await http.post(url);  
    return json.decode(response.body);
  }
}