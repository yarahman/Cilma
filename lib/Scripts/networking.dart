import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.Url);

  final String Url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      String data = response.body;
      var deCoded = jsonDecode(data);
      return deCoded;
    } else {
      print(response.statusCode);
    }
  }
}
