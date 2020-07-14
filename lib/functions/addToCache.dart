import 'dart:async';

String cache = '';

void addToCache(String text) {
  if (cache.length + text.length > 20) {
    emptyCache();
  }

  cache += text;
}

void emptyCache() {
  final _cache = cache;

  print('sent cache');
  print(_cache);

  cache = '';
}
