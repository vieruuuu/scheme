import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetKeyStateC = Int16 Function(Int32 nVirtKey);

typedef GetKeyStateDart = int Function(int nVirtKey);

/// SHORT GetKeyState(
///   int nVirtKey
/// );
GetKeyStateDart GetKeyState =
    User32.lookupFunction<GetKeyStateC, GetKeyStateDart>('GetKeyState');
