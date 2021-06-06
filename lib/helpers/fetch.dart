import 'dart:convert';
import 'package:shop/helpers/api_key.dart';
import 'package:http/http.dart' as http;

class FetchHelper {
  final String url;
  final String path;
  FetchHelper(this.url, this.path);

  Future<dynamic> getData({int categoryId, int parentId}) async {
    var params = {'appKey': shopApiKey};
    if (categoryId != null) {
      params['categoryId'] = categoryId.toString();
    }

    if (parentId != null) {
      print('fetch parentId not null and is ${parentId.toString()}');
      params['parentId'] = parentId.toString();
    }
    var uri = Uri.http(url, path, params);
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
