import 'dart:ffi';

import 'package:ffi/ffi.dart';

/// typedef struct tagKBDLLHOOKSTRUCT {
///   DWORD     vkCode;
///   DWORD     scanCode;
///   DWORD     flags;
///   DWORD     time;
///   ULONG_PTR dwExtraInfo;
/// } KBDLLHOOKSTRUCT, *LPKBDLLHOOKSTRUCT, *PKBDLLHOOKSTRUCT;
class KBDLLHOOKSTRUCT extends Struct {
  @Uint32()
  int vKCode;

  @Uint32()
  int scanCode;

  @Uint32()
  int flags;

  @Uint32()
  int time;

  Pointer<Uint32> dwExtraInfo;

  factory KBDLLHOOKSTRUCT.allocate() => allocate<KBDLLHOOKSTRUCT>().ref
    ..vKCode = 0
    ..scanCode = 0
    ..flags = 0
    ..time = 0
    ..dwExtraInfo = nullptr;
}
