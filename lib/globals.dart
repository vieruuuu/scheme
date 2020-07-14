/// variabile globale de care o sa am nev in mai toate fisierele

import 'dart:ffi';
import 'dart:isolate';

import 'native_functions/GetModuleHandle.dart';

/// am nev de el pentru [SetWindowsHookEx]
/// ii global ca sa poata fi accesat din c
final hmod = GetModuleHandle(nullptr);

/// pentru a trimite mesaje inapoi din c
SendPort MSGIsolateToMain;

/// pentru a continua callbackurile din c
Pointer hhook;
