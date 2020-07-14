import 'dart:ffi';

import 'package:schema/constants.dart';
import 'package:schema/native_functions/GetKeyboardLayout.dart';
import 'package:schema/native_functions/MapVirtualKeyEx.dart';
import 'package:schema/native_functions/GetKeyState.dart';

String toCorrectKey(int wParam, int key) {
  String result = '';
  int finalKey = key;
  Pointer layout = GetKeyboardLayout(0);

  // print(finalKey);

  switch (finalKey) {
    case 0x08:
      return '[BACKSPACE]';
    case 0x0D:
      return '[ENTER]';
    case 0x20:
      return ' ';
    case 0x09:
      return '[TAB]';
    case 0x10:
    case 0xA0:
    case 0xA1:
      return '[SHIFT]';
    case 0x11:
    case 0xA2:
    case 0xA3:
      return '[CTRL]';
    case 0x1B:
      return '[ESC]';
    case 0x23:
      return '[END]';
    case 0x24:
      return '[HOME]';
    case 0x25:
      return '[LEFT]';
    case 0x26:
      return '[UP]';
    case 0x27:
      return '[RIGHT]';
    case 0x28:
      return '[DOWN]';
    case 0x14:
      return '[CAPS]';
    case 112:
      return '[F1]';
    case 113:
      return '[F2]';
    case 114:
      return '[F3]';
    case 115:
      return '[F4]';
    case 116:
      return '[F5]';
    case 117:
      return '[F6]';
    case 118:
      return '[F7]';
    case 119:
      return '[F8]';
    case 120:
      return '[F9]';
    case 121:
      return '[F10]';
    case 122:
      return '[F11]';
    case 123:
      return '[F12]';
    case 225:
      return '[WIFI]';
    case 45:
      return '[INSERT]';
    case 46:
      return '[DEL]';
    case 144:
      return '[NUMLOCK]';
    case 91:
    case 92:
      return '[WIN]';
  }

  finalKey = MapVirtualKeyEx(key, MAPVK_VK_TO_CHAR, layout);
  
  if (finalKey == 0) {
    return '';
  }

  result = String.fromCharCode(finalKey);

  bool isAlpha = RegExp(r'^[a-zA-Z]+$').hasMatch(result);
  bool lowercase = GetKeyState(0x14) == 0;
  bool isShifting =
      GetKeyState(0x10) < 0 || GetKeyState(0xA0) < 0 || GetKeyState(0xA1) < 0;

  if (isShifting && isAlpha) {
    lowercase = !lowercase;
  }

  if (lowercase) {
    result = result.toLowerCase();
  }

  return result;
}
