import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef ReleaseDCC = Int32 Function(IntPtr hWnd, Pointer hDC);
typedef ReleaseDCDart = int Function(int hWnd, Pointer hDC);

/// int ReleaseDC(
///   HWND hWnd,
///   HDC  hDC
/// );
final ReleaseDCDart ReleaseDC =
    User32.lookupFunction<ReleaseDCC, ReleaseDCDart>('ReleaseDC');
