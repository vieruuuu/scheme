import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:schema/dylib/kernel32.dart';

typedef GetModuleHandleC = IntPtr Function(Pointer<Utf16> lpModuleName);
typedef GetModuleHandleDart = int Function(Pointer<Utf16> lpModuleName);

/// HMODULE GetModuleHandleW(
///   LPCWSTR lpModuleName
/// );
final GetModuleHandleDart GetModuleHandle = kernel32
    .lookupFunction<GetModuleHandleC, GetModuleHandleDart>('GetModuleHandleW');
