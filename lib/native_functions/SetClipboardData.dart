import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef SetClipboardDataC = Pointer Function(Uint32 uFormat, Pointer hMem);
typedef SetClipboardDataDart = Pointer Function(int uFormat, Pointer hMem);

/// HANDLE SetClipboardData(
///   UINT   uFormat,
///   HANDLE hMem
/// );
final SetClipboardDataDart SetClipboardData =
    User32.lookupFunction<SetClipboardDataC, SetClipboardDataDart>(
        'SetClipboardData');
