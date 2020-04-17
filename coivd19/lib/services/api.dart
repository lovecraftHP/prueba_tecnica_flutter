import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static String _urlBase = 'https://api.covid19api.com';

  Future getContriesStatics() async {
    http.Response res = await http.get('$_urlBase/summary');
    var data = json.decode(res.body);
    return data['Countries'];
  }

  Future getGlobalStatics() async {
    http.Response res = await http.get('$_urlBase/summary');
    var data = json.decode(res.body);
    return data['Global'];
  }
}
