import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef CreateCompatibleDCC = Pointer Function(Pointer hdc);

typedef CreateCompatibleDCDart = Pointer Function(Pointer hdc);

/// HDC CreateCompatibleDC(
///   HDC hdc
/// );
final CreateCompatibleDCDart CreateCompatibleDC =
    Gdi32.lookupFunction<CreateCompatibleDCC, CreateCompatibleDCDart>(
        'CreateCompatibleDC');
