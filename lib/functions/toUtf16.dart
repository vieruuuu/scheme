import 'dart:ffi';

/// Convert pointer to a string using [len] as lenght of wchar_t pointer
String toUtf16(Pointer s, int len) {
  String Sfinal = '';
  final sCasted = s.cast<Int8>();

  for (var i = 0; i < len; i++) {
    Sfinal += String.fromCharCode(sCasted.elementAt(i).value);
  }

  return Sfinal;
}
