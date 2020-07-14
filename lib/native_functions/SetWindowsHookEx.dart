import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

/// LRESULT __stdcall HookCallback(int nCode, WPARAM wParam, LPARAM lParam)
typedef HookCallback = IntPtr Function(
    Int32 nCode, IntPtr wParam, IntPtr lParam);

typedef SetWindowsHookExC = Pointer Function(
    Int32 idHook, Pointer lpfn, IntPtr hmod, Uint32 dwThreadId);

typedef SetWindowsHookExDart = Pointer Function(
    int idHook, Pointer lpfn, int hmod, int dwThreadId);

/// HHOOK SetWindowsHookExA(
///   int       idHook,
///   HOOKPROC  lpfn,
///   HINSTANCE hmod,
///   DWORD     dwThreadId
/// );
final SetWindowsHookExDart SetWindowsHookEx =
    User32.lookupFunction<SetWindowsHookExC, SetWindowsHookExDart>(
        'SetWindowsHookExA');
