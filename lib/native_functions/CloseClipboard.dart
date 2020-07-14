import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef CloseClipboardC = Int32 Function();
typedef CloseClipboardDart = int Function();

/// BOOL CloseClipboard();
final CloseClipboardDart CloseClipboard =
    User32.lookupFunction<CloseClipboardC, CloseClipboardDart>(
        'CloseClipboard');
