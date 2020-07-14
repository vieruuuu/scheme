import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef MapVirtualKeyExC = Uint32 Function(
    Uint32 uCode, Uint32 uMapType, Pointer dwhkl);

typedef MapVirtualKeyExDart = int Function(
    int uCode, int uMapType, Pointer dwhkl);

/// UINT MapVirtualKeyExA(
///   UINT uCode,
///   UINT uMapType,
///   HKL  dwhkl
/// );
final MapVirtualKeyExDart MapVirtualKeyEx =
    User32.lookupFunction<MapVirtualKeyExC, MapVirtualKeyExDart>(
        'MapVirtualKeyExA');
