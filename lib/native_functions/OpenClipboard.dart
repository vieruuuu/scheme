import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef OpenClipboardC = Int32 Function(IntPtr hWndNewOwner);
typedef OpenClipboardDart = int Function(int hWndNewOwner);

/// BOOL OpenClipboard(
///   HWND hWndNewOwner
/// );
final OpenClipboardDart OpenClipboard =
    User32.lookupFunction<OpenClipboardC, OpenClipboardDart>('OpenClipboard');
