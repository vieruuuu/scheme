import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:schema/types/glot.dart';

/// Listeaza snippeturile
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/list_snippets.md
void GlotListSnippets() async {
  final http.Response response =
      await http.get('https://snippets.glot.io/snippets');

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = convert.jsonDecode(response.body);

    // mai eficient asa, daca opresc forul undeva celelalte nu s deserializate
    for (final Map<String, dynamic> res in jsonResponse) {
      final GlotSnippetSimple snippet = GlotSnippetSimple.fromJson(res);

      // momentan le afisez ca nush ce sa fac cu ele
      print(snippet.id);
    }
  } else {
    // trebuie sa gasesc alta modalitate pentru a ma ocupa de erori
    print('error: ${response.statusCode}.');
  }
}
