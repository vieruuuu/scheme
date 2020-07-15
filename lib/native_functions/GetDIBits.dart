import 'dart:ffi';

import 'package:schema/dylib/Gdi32.dart';
import 'package:schema/native_types/LPBITMAPINFO.dart';

typedef GetDIBitsC = Int32 Function(Pointer hdc, Pointer hbm, Uint32 start,
    Uint32 cLines, IntPtr lpvBits, Pointer<LPBITMAPINFO> lpbmi, Uint32 usage);
typedef GetDIBitsDart = int Function(Pointer hdc, Pointer hbm, int start,
    int cLines, int lpvBits, Pointer<LPBITMAPINFO> lpbmi, int usage);

/// int GetDIBits(
///   HDC          hdc,
///   HBITMAP      hbm,
///   UINT         start,
///   UINT         cLines,
///   LPVOID       lpvBits,
///   LPBITMAPINFO lpbmi,
///   UINT         usage
/// );
final GetDIBitsDart GetDIBits =
    Gdi32.lookupFunction<GetDIBitsC, GetDIBitsDart>('GetDIBits');
