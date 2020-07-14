import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetDCC = Pointer Function(IntPtr hWnd);
typedef GetDCDart = Pointer Function(int hWnd);

/// HDC GetDC(
///   HWND hWnd
/// );
final GetDCDart GetDC = User32.lookupFunction<GetDCC, GetDCDart>('GetDC');