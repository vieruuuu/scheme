import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetForegroundWindowC = IntPtr Function();

typedef GetForegroundWindowDart = int Function();

/// HWND GetForegroundWindow();
final GetForegroundWindowDart GetForegroundWindow =
    User32.lookupFunction<GetForegroundWindowC, GetForegroundWindowDart>(
        'GetForegroundWindow');
