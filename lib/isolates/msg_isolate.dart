import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';

import 'package:schema/constants.dart';
import 'package:schema/functions/addToCache.dart';
import 'package:schema/functions/toCorrectKey.dart';
import 'package:schema/globals.dart';
import 'package:schema/native_functions/CallNextHookEx.dart';
import 'package:schema/native_functions/DispatchMessage.dart';
import 'package:schema/native_functions/GetMessage.dart';
import 'package:schema/native_functions/SetWindowsHookEx.dart';
import 'package:schema/native_functions/TranslateMessage.dart';
import 'package:schema/types/KBDLLHOOKSTRUCT.dart';
import 'package:schema/types/MSG.dart';

int Callback(int nCode, int wParam, int lParam) {
  if (nCode == 0) {
    if (wParam == WM_KEYDOWN) {
      KBDLLHOOKSTRUCT kbdStruct =
          Pointer.fromAddress(lParam).cast<KBDLLHOOKSTRUCT>().ref;

      final key = toCorrectKey(wParam, kbdStruct.vKCode);

      // isolateToMainStreamGlobal.send('sal cf');

      addToCache(key);
    }
  }

  return CallNextHookEx(hhook, nCode, wParam, lParam);
}

void setHook() {
  final lpfn = Pointer.fromFunction<HookCallback>(Callback, 0);

  hhook = SetWindowsHookEx(WH_KEYBOARD_LL, lpfn, hmod, 0);
}

Future<SendPort> initIsolate() async {
  Completer completer = new Completer<SendPort>();

  ReceivePort isolateToMainStream = ReceivePort();

  isolateToMainStream.listen((data) {
    if (data is SendPort) {
      SendPort mainToIsolateStream = data;

      completer.complete(mainToIsolateStream);
    } else {
      print('[isolateToMainStream] $data');
    }
  });

  Isolate myIsolateInstance =
      await Isolate.spawn(myIsolate, isolateToMainStream.sendPort);

  return completer.future;
}

void myIsolate(SendPort isolateToMainStream) {
  isolateToMainStreamGlobal = isolateToMainStream;

  ReceivePort mainToIsolateStream = ReceivePort();

  isolateToMainStream.send(mainToIsolateStream.sendPort);

  isolateToMainStream.send('started');

  setHook();

  final msg = MSG.allocate();

  while (GetMessage(msg.addressOf, 0, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
}
