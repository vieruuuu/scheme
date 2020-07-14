import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef CallNextHookExC = IntPtr Function(
    Pointer hhk, Int32 nCode, IntPtr wParam, IntPtr lParam);

typedef CallNextHookExDart = int Function(
    Pointer hhk, int nCode, int wParam, int lParam);

/// LRESULT CallNextHookEx(
///   HHOOK  hhk,
///   int    nCode,
///   WPARAM wParam,
///   LPARAM lParam
/// );
final CallNextHookExDart CallNextHookEx =
    User32.lookupFunction<CallNextHookExC, CallNextHookExDart>(
        'CallNextHookEx');
