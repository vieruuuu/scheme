import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:schema/types/glot.dart';

/// Ia un singur snippet
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/get_snippet.md
Future<GlotSnippet> GlotGetSnippet(String snippetId) async {
  final http.Response response =
      await http.get('https://snippets.glot.io/snippets/' + snippetId);

  final Map jsonResponse = convert.jsonDecode(response.body);

  final GlotSnippet snippet = GlotSnippet.fromJson(jsonResponse);

  return snippet;
}
