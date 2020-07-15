// curl --request GET \
//     --url 'https://snippets.glot.io/snippets'

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final String url = 'https://snippets.glot.io/snippets';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse[0]['url']);
  } else {
    print('error: ${response.statusCode}.');
  }
}
