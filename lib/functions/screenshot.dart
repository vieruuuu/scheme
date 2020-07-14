import 'dart:ffi';

import 'package:schema/native_functions/GetSystemMetrics.dart';
import 'package:schema/native_functions/CreateCompatibleBitmap.dart';
import 'package:schema/native_functions/GetDC.dart';
import 'package:schema/native_functions/CreateCompatibleDC.dart';
import 'package:schema/native_functions/SelectObject.dart';
import 'package:schema/native_functions/BitBlt.dart';
import 'package:schema/native_functions/OpenClipboard.dart';
import 'package:schema/native_functions/EmptyClipboard.dart';
import 'package:schema/native_functions/SetClipboardData.dart';
import 'package:schema/native_functions/CloseClipboard.dart';
import 'package:schema/native_functions/DeleteDC.dart';
import 'package:schema/native_functions/ReleaseDC.dart';
import 'package:schema/native_functions/DeleteObject.dart';

import 'package:schema/constants.dart';

void screenshot() {
  // get screen dimensions
  final int x = GetSystemMetrics(SM_XVIRTUALSCREEN);
  final int y = GetSystemMetrics(SM_YVIRTUALSCREEN);
  final int cx = GetSystemMetrics(SM_CXVIRTUALSCREEN);
  final int cy = GetSystemMetrics(SM_CYVIRTUALSCREEN);

  final Pointer hScreen = GetDC(0);
  final Pointer hDC = CreateCompatibleDC(hScreen);
  final Pointer hBitmap =
      CreateCompatibleBitmap(hScreen, (cx - x).abs(), (cy - y).abs());
  final Pointer old_obj = SelectObject(hDC, hBitmap);

  BitBlt(hDC, 0, 0, (cx - x).abs(), (cy - y).abs(), hScreen, x, y, SRCCOPY);

  // copy to clipboard
  OpenClipboard(0);
  EmptyClipboard();
  SetClipboardData(CF_BITMAP, hBitmap);
  CloseClipboard();

  // cleanup
  SelectObject(hDC, old_obj);
  DeleteDC(hDC);
  ReleaseDC(0, hScreen);
  DeleteObject(hBitmap);
}
