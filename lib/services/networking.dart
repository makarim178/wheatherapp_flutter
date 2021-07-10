import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);
  final String url;

  Future getData() async{

    var urlConv = Uri.parse(url);
    var response =  await http.get(urlConv);

    if(response.statusCode == 200) {
      String data = response.body;
      return  jsonDecode(data);
    } else {
      print(response.statusCode);
    }

  }

}

