import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetWindowTextC = Int32 Function(
    IntPtr hWnd, Pointer lpString, Int32 nMaxCount);

typedef GetWindowTextDart = int Function(
    int hWnd, Pointer lpString, int nMaxCount);

/// int GetWindowTextA(
///   HWND  hWnd,
///   LPSTR lpString,
///   int   nMaxCount
/// );
final GetWindowTextDart GetWindowText =
    User32.lookupFunction<GetWindowTextC, GetWindowTextDart>('GetWindowTextA');
