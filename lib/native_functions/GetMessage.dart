import 'dart:ffi';

import 'package:schema/dylib/User32.dart';
import 'package:schema/types/MSG.dart';

typedef GetMessageC = Int32 Function(Pointer<MSG> lpMsg, IntPtr hWnd,
    Uint32 wMsgFilterMin, Uint32 wMsgFilterMax);

typedef GetMessageDart = int Function(
    Pointer<MSG> lpMsg, int hWnd, int wMsgFilterMin, int wMsgFilterMax);

/// BOOL GetMessage(
///   LPMSG lpMsg,
///   HWND  hWnd,
///   UINT  wMsgFilterMin,
///   UINT  wMsgFilterMax
/// );
final GetMessage =
    User32.lookupFunction<GetMessageC, GetMessageDart>('GetMessageW');
