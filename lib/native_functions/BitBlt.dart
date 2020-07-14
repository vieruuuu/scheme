import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef BitBltC = Int32 Function(Pointer hdc, Int32 x, Int32 y, Int32 cx,
    Int32 cy, Pointer hdcSrc, Int32 x1, Int32 y1, Uint32 rop);
typedef BitBltDart = int Function(Pointer hdc, int x, int y, int cx, int cy,
    Pointer hdcSrc, int x1, int y1, int rop);

/// BOOL BitBlt(
///   HDC   hdc,
///   int   x,
///   int   y,
///   int   cx,
///   int   cy,
///   HDC   hdcSrc,
///   int   x1,
///   int   y1,
///   DWORD rop
/// );
final BitBltDart BitBlt = Gdi32.lookupFunction<BitBltC, BitBltDart>('BitBlt');
