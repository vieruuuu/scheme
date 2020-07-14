import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef DeleteDCC = Int32 Function(Pointer hdc);
typedef DeleteDCDart = int Function(Pointer hdc);

/// BOOL DeleteDC(
///   HDC hdc
/// );
final DeleteDCDart DeleteDC =
    Gdi32.lookupFunction<DeleteDCC, DeleteDCDart>('DeleteDC');
