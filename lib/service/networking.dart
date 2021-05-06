import 'dart:convert';

import 'package:http/http.dart';

class NetworkingHelper {
  static const String _apiKey = "d8cb53bd977c2d3703d6247d837019f7";
  static const String _baseUrl =
      "https://api.openweathermap.org/data/2.5/forecast?q={0}&appid={1}&units=metric";

  Future getDataFor({String city}) async {
    String url = _composeUrl(city);
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("🔴 Error " + response.statusCode.toString());
    }
  }

  String _composeUrl(city) {
    String url = _baseUrl.replaceFirst("{0}", city);
    url = url.replaceFirst("{1}", _apiKey);
    return url;
  }
}
