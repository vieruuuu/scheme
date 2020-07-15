import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/// o clasa pentru un response de la glot cu un snippet simplu
class GlotSnippetSimple {
  /// ex: "fp3r3oqtq8"
  final String id;

  GlotSnippetSimple(this.id);

  GlotSnippetSimple.fromJson(Map<String, dynamic> json) : id = json['id'];
}

/// pentru proprietatea [files] din [GlotSnippet]
class GlotSnippetFile {
  final String content;

  GlotSnippetFile(this.content);

  GlotSnippetFile.fromJson(Map<String, dynamic> json)
      : content = json['content'];
}

/// clasa pentru snippetul glot full
class GlotSnippet {
  /// ex: "fp3r3oqtq8"
  final String id;

  final List<GlotSnippetFile> files;

  GlotSnippet(this.id, this.files);

  GlotSnippet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        files = (json['files'] as List)
            .map((i) => GlotSnippetFile.fromJson(i))
            .toList();
}

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

      // TODO: integreaza GlotGetSnippet aici si transforma functia asta in searchsnippet
      // momentan le afisez ca nush ce sa fac cu ele
      print(snippet.id);
    }
  } else {
    // trebuie sa gasesc alta modalitate pentru a ma ocupa de erori
    print('error: ${response.statusCode}.');
  }
}

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

/// creezi un snippet glot
/// TODO: trb sa vad ce quota ii pe zi sau pe ora cat era
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/create_snippet.md
Future<GlotSnippet> GlotCreateSnippet(bool public, String data) async {
  final String url = 'https://snippets.glot.io/snippets';

  final http.Response response = await http.post(url, body: '''{
      "public": $public,
      "files": [
        {"content": "$data"}
      ]
    }''', headers: {"Content-type": "application/json"});
  print(response.body);
  if (response.statusCode == 200) {
    return GlotSnippet.fromJson(convert.jsonDecode(response.body));
  } else {
    throw response;
  }
}

void main() async {
  try {
    await GlotCreateSnippet(true, "sal cf");
  } catch (e) {
    print(e.statusCode);
    print(e.body);
  }

  // print('https://snippets.glot.io/snippets/' + sal.id);
}
