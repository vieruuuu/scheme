import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';

typedef DeleteObjectC = Int32 Function(Pointer ho);
typedef DeleteObjectDart = int Function(Pointer ho);

/// BOOL DeleteObject(
///   HGDIOBJ ho
/// );
final DeleteObjectDart DeleteObject =
    Gdi32.lookupFunction<DeleteObjectC, DeleteObjectDart>('DeleteObject');
