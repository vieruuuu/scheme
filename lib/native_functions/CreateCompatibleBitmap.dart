import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef CreateCompatibleBitmapC = Pointer Function(
    Pointer hdc, Int32 cx, Int32 cy);

typedef CreateCompatibleBitmapDart = Pointer Function(
    Pointer hdc, int cx, int cy);

/// HBITMAP CreateCompatibleBitmap(
///   HDC hdc,
///   int cx,
///   int cy
/// );
final CreateCompatibleBitmapDart CreateCompatibleBitmap =
    Gdi32.lookupFunction<CreateCompatibleBitmapC, CreateCompatibleBitmapDart>(
        'CreateCompatibleBitmap');
