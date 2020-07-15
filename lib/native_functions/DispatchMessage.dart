import 'dart:ffi';

import 'package:schema/dylib/User32.dart';
import 'package:schema/native_types/MSG.dart';

typedef DispatchMessageC = IntPtr Function(Pointer<MSG> lpMsg);

typedef DispatchMessageDart = int Function(Pointer<MSG> lpMsg);

/// LRESULT DispatchMessage(
///   const MSG *lpMsg
/// );
final DispatchMessageDart DispatchMessage =
    User32.lookupFunction<DispatchMessageC, DispatchMessageDart>(
        'DispatchMessageW');
