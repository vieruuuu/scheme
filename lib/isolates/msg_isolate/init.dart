/// am creat isolateul pentru ca GetMessage
/// imi ocupa tot mainul si nu pot sa mai fac nimic async

import 'dart:isolate';

import 'isolate.dart';

/// creeaza isolateul [MSGIsolate]
void initMSGIsolate() {
  ReceivePort isolateToMainStream = ReceivePort();

  // daca primesc mesaje de la MSGIsolate
  isolateToMainStream.listen((data) {
    print('[MSGIsolate] $data');
  });

  // nu am ce face cu
  // Isolate myIsolateInstance = await
  Isolate.spawn(MSGIsolate, isolateToMainStream.sendPort);
}
