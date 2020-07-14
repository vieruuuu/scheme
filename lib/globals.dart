import 'dart:ffi';
import 'dart:isolate';

import 'native_functions/GetModuleHandle.dart';

final hmod = GetModuleHandle(nullptr);

SendPort isolateToMainStreamGlobal;

Pointer hhook;
