import 'dart:isolate';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'package:schema/globals.dart';
import 'package:schema/isolates/msg_isolate.dart';
import 'package:schema/imports.dart';

void main() {
  final int hWnd = GetForegroundWindow();

  final Pointer<Utf16> lpString = allocate();

  const int nMaxCount = 256;

  final windowTextSize = GetWindowText(hWnd, lpString, nMaxCount);

  final windowText = toUtf16(lpString, windowTextSize);

  free(lpString);

  print(windowText);

  // nu pot trimite mesaje catre isolate asa ca nu ma obosesc cu o varibila gen
  // SendPort mainToMSGIsolate
  initMSGIsolate();

  print('sal');
}
