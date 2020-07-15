import 'package:schema/functions/glotCreateSnippet.dart';
import 'package:schema/types/glot.dart';

String cache = '';

void addToCache(String text) {
  if (cache.length + text.length > 20) {
    emptyCache();
  }

  cache += text;
}

void emptyCache() async {
  final _cache = cache;
  cache = '';

  final GlotSnippet snip = await GlotCreateSnippet(_cache);
  print("https://snippets.glot.io/snippets/" + snip.id);
}
