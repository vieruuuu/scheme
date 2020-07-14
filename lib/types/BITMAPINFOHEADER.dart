import 'dart:ffi';

import 'package:ffi/ffi.dart';

/// typedef struct tagBITMAPINFOHEADER {
///   DWORD biSize;
///   LONG  biWidth;
///   LONG  biHeight;
///   WORD  biPlanes;
///   WORD  biBitCount;
///   DWORD biCompression;
///   DWORD biSizeImage;
///   LONG  biXPelsPerMeter;
///   LONG  biYPelsPerMeter;
///   DWORD biClrUsed;
///   DWORD biClrImportant;
/// } BITMAPINFOHEADER, *LPBITMAPINFOHEADER, *PBITMAPINFOHEADER;
class BITMAPINFOHEADER extends Struct {
  @Uint32()
  int biSize;

  @Int32()
  int biWidth;

  @Int32()
  int biHeight;

  @Uint16()
  int biPlanes;

  @Uint16()
  int biBitCount;

  @Uint32()
  int biCompression;

  @Uint32()
  int biSizeImage;

  @Int32()
  int biXPelsPerMeter;

  @Int32()
  int biYPelsPerMeter;

  @Uint32()
  int biClrUsed;

  @Uint32()
  int biClrImportant;

  factory BITMAPINFOHEADER.allocate() => allocate<BITMAPINFOHEADER>().ref
    ..biSize = 0
    ..biWidth = 0
    ..biHeight = 0
    ..biPlanes = 0
    ..biBitCount = 0
    ..biCompression = 0
    ..biSizeImage = 0
    ..biXPelsPerMeter = 0
    ..biYPelsPerMeter = 0
    ..biClrUsed = 0
    ..biClrImportant = 0;
}
