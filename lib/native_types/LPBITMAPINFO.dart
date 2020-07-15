import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'BITMAPINFOHEADER.dart';
import 'RGBQUAD.dart';

/// typedef struct tagBITMAPINFO {
///   BITMAPINFOHEADER bmiHeader;
///   RGBQUAD          bmiColors[1];
/// } BITMAPINFO, *LPBITMAPINFO, *PBITMAPINFO;

// aici e mare buba
// https://github.com/dart-lang/sdk/issues/37271

class LPBITMAPINFO extends Struct {
  Pointer<BITMAPINFOHEADER> bmiHeader;
  Pointer<RGBQUAD> bmiColors;

  factory LPBITMAPINFO.allocate(
          {Pointer<BITMAPINFOHEADER> bmiHeader, Pointer<RGBQUAD> bmiColors}) =>
      allocate<LPBITMAPINFO>().ref
        ..bmiHeader = bmiHeader
        ..bmiColors = bmiColors;
}
