import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class Networkhelper {
  Networkhelper(this.u);

  final Uri u;
  Future getdata() async {
    http.Response response = await http.get(u);

    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
