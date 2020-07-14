import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef SelectObjectC = Pointer Function(Pointer hdc, Pointer h);
typedef SelectObjectDart = Pointer Function(Pointer hdc, Pointer h);

/// HGDIOBJ SelectObject(
///   HDC     hdc,
///   HGDIOBJ h
/// );
final SelectObjectDart SelectObject =
    Gdi32.lookupFunction<SelectObjectC, SelectObjectDart>('SelectObject');
