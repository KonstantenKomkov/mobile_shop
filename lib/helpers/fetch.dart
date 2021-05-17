import 'dart:convert';
import 'package:shop/helpers/api_key.dart';
import 'package:http/http.dart' as http;

class FetchHelper {
  final String url;
  final String path;
  FetchHelper(this.url, this.path);

  Future<dynamic> getData() async {
    var uri = Uri.http(url, path, {'appKey': shopApiKey});
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      try {
        var answer = jsonDecode(response.body);
        if (answer['meta']['success']) {
          return answer['data'];
        } else {
          print(answer['meta']['error']);
        }
      } catch (e) {
        print('Invalid json!');
      }
      return;
    } else {
      throw Exception('Error ${response.reasonPhrase}');
    }
  }
}
