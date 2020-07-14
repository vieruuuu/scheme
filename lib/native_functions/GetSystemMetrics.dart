import 'dart:ffi';

import 'package:schema/dylib/User32.dart';

typedef GetSystemMetricsC = Int32 Function(Int32 nIndex);
typedef GetSystemMetricsDart = int Function(int nIndex);

/// int GetSystemMetrics(
///   int nIndex
/// );
final GetSystemMetricsDart GetSystemMetrics =
    User32.lookupFunction<GetSystemMetricsC, GetSystemMetricsDart>(
        'GetSystemMetrics');
