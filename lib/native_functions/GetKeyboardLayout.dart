import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetKeyboardLayoutC = Pointer Function(Uint32 idThread);

typedef GetKeyboardLayoutDart = Pointer Function(int idThread);

/// HKL GetKeyboardLayout(
///   DWORD idThread
/// );
final GetKeyboardLayoutDart GetKeyboardLayout =
    User32.lookupFunction<GetKeyboardLayoutC, GetKeyboardLayoutDart>(
        'GetKeyboardLayout');
