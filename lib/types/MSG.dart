import 'dart:ffi';
import 'package:ffi/ffi.dart';

/// typedef struct tagMSG {
///   HWND   hwnd;
///   UINT   message;
///   WPARAM wParam;
///   LPARAM lParam;
///   DWORD  time;
///   POINT  pt;
///   DWORD  lPrivate;
/// } MSG, *PMSG, *NPMSG, *LPMSG;
class MSG extends Struct {
  @IntPtr()
  int hwnd;

  @Uint32()
  int message;

  @IntPtr()
  int wParam;

  @IntPtr()
  int lParam;

  @Uint32()
  int time;

  @Int32()
  int ptX;

  @Int32()
  int ptY;

  @Uint32()
  int lPrivate;

  factory MSG.allocate() => allocate<MSG>().ref
    ..hwnd = 0
    ..message = 0
    ..wParam = 0
    ..lParam = 0
    ..time = 0
    ..ptX = 0
    ..ptY = 0
    ..lPrivate = 0;
}
