import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/// o clasa pentru un response de la glot cu un snippet simplu \
/// trebuie sa comentez niste proprietati ca sa fac codul mai eficient \
/// deoarece nu am nev de chiar toate datele din response \
/// si nu trage asa tare la procesor asa
class GlotSnippetSimple {
  /// ex: "https://snippets.glot.io/snippets/fp3r3oqtq8"
  final String url;

  /// ex: "fp3r3oqtq8"
  final String id;

  /// ex: "2015-04-23T22:03:41Z"
  final String created;

  /// ex: "2015-04-23T22:03:41Z"
  final String modified;

  /// ex: "perl"
  final String language;

  /// ex: "Hello world"
  final String title;

  /// ex: true
  final bool public;

  /// ex: "anonymous"
  final String owner;

  /// ex: "20f74f4277cafb12cd46e68008574dc92c5be35e"
  final String files_hash;

  GlotSnippetSimple(this.url, this.id, this.created, this.modified,
      this.language, this.title, this.public, this.owner, this.files_hash);

  GlotSnippetSimple.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        id = json['id'],
        created = json['created'],
        modified = json['modified'],
        language = json['language'],
        title = json['title'],
        public = json['public'],
        owner = json['owner'],
        files_hash = json['files_hash'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'id': id,
        'created': created,
        'modified': modified,
        'language': language,
        'title': title,
        'public': public,
        'owner': owner,
        'files_hash': files_hash,
      };
}

/// Listeaza snippeturile
///
/// curl --request GET \
///     --url 'https://snippets.glot.io/snippets'
void GlotListSnippets() async {
  final String url = 'https://snippets.glot.io/snippets';

  final http.Response response = await http.get(url);

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

void main() async {}
