import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef EmptyClipboardC = Int32 Function();
typedef EmptyClipboardDart = int Function();

/// BOOL EmptyClipboard();
final EmptyClipboardDart EmptyClipboard =
    User32.lookupFunction<EmptyClipboardC, EmptyClipboardDart>(
        'EmptyClipboard');
