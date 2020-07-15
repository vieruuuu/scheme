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

/// pentru proprietatea [files] din [GlotSnippet]
///
/// [
///  {
///    "name": "main.py",
///    "content": "print(42)"
///  }
///]
class GlotSnippetFile {
  final String name;
  final String content;

  GlotSnippetFile(this.name, this.content);

  GlotSnippetFile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        content = json['content'];
}

/// clasa pentru snippetul glot full\
/// trb sa vad cum fac faza cu extends sa nu mai fie asa de mult scris aici\
/// la fel, trb sa scot proprietatile nefolositoare de aici
class GlotSnippet {
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

  final List<GlotSnippetFile> files;

  GlotSnippet(this.url, this.id, this.created, this.modified, this.language,
      this.title, this.public, this.owner, this.files_hash, this.files);

  GlotSnippet.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        id = json['id'],
        created = json['created'],
        modified = json['modified'],
        language = json['language'],
        title = json['title'],
        public = json['public'],
        owner = json['owner'],
        files = (json['files'] as List)
            .map((i) => GlotSnippetFile.fromJson(i))
            .toList(),
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
        'files': files,
        'files_hash': files_hash,
      };
}

/// Listeaza snippeturile
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/list_snippets.md
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

/// Ia un singur snippet
///
/// https://github.com/prasmussen/glot-snippets/blob/master/api_docs/get_snippet.md
void GlotGetSnippet(String snippetId) async {
  final String url = 'https://snippets.glot.io/snippets/' + snippetId;

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    final Map jsonResponse = convert.jsonDecode(response.body);

    final GlotSnippet snippet = GlotSnippet.fromJson(jsonResponse);

    // normal ar trebui sa returnez cv dar momentan ii bn si asa
    print(snippet.files[0].name);
  } else {
    // trebuie sa gasesc alta modalitate pentru a ma ocupa de erori
    print('error: ${response.statusCode}.');
  }
}

void main() async {
  GlotGetSnippet('fp3r3oqtq8');
}
