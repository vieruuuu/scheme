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
