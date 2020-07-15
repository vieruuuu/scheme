import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:schema/types/glot.dart';

/// creezi un snippet glot
/// TODO: trb sa vad ce quota ii pe zi sau pe ora cat era
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/create_snippet.md
Future<GlotSnippet> GlotCreateSnippet(String data) async {
  final String url = 'https://snippets.glot.io/snippets';

  final http.Response response = await http.post(url, body: '''{
      "public": true,
      "files": [
        {"content": "$data"}
      ]
    }''', headers: {"Content-type": "application/json"});

  if (response.statusCode == 200) {
    return GlotSnippet.fromJson(convert.jsonDecode(response.body));
  } else {
    throw response;
  }
}
