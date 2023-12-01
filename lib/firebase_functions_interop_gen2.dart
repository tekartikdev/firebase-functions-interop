// Copyright (c) 2017, Anatoly Pulyaevskiy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Interop library for Firebase Functions Node.js SDK.
///
/// Use [functionsGen2] object as main entry point.
///
/// To create your cloud function see corresponding namespaces on
/// [FirebaseFunctionsGen2] class:
///
/// - [FirebaseFunctionsGen2.https] for creating HTTPS triggers
/// - [FirebaseFunctionsGen2.database] for creating Realtime Database triggers
/// - [FirebaseFunctionsGen2.firestore] for creating Firestore triggers
///
/// Here is an example of creating and exporting an HTTPS trigger:
///
///     import 'package:firebase_functions_interop/firebase_functions_interop.dart';
///
///     void main() {
///       // Registers helloWorld function under path prefix `/helloWorld`
///       functions['helloWorld'] = functions.https
///         .onRequest(helloWorld);
///     }
///
///     // Simple function which returns a response with a body containing
///     // "Hello world".
///     void helloWorld(ExpressHttpRequest request) {
///       request.response.writeln("Hello world");
///       request.response.close();
///     }
library firebase_functions_interop_v2;

import 'package:firebase_functions_interop/src/interop_gen2.dart';

export 'src/bindings_gen2.dart' show CloudEventGen2JsExt;
export 'src/interop_gen2.dart'
    show FirebaseFunctionsGen2, FirestoreFunctionsGen2, functionsGen2;
export 'src/interop_gen2.dart' show FirebaseFunctionsGen2;
