import 'dart:ffi';

import 'package:schema/dylib/User32.dart';
import 'package:schema/native_types/MSG.dart';

typedef TranslateMessageC = Int32 Function(Pointer<MSG> lpMsg);

typedef TranslateMessageDart = int Function(Pointer<MSG> lpMsg);

/// BOOL TranslateMessage(
///   const MSG *lpMsg
/// );
final TranslateMessageDart TranslateMessage =
    User32.lookupFunction<TranslateMessageC, TranslateMessageDart>(
        'TranslateMessage');
