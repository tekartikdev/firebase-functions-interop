// Copyright (c) 2017, Anatoly Pulyaevskiy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

@JS()
library firebase_functions_interop.bindings_gen2;

import 'package:js/js.dart';
import 'package:node_interop/http.dart';

import 'bindings.dart';

extension HttpsFunctionsExtGen2Js on HttpsFunctions {
  /// Event handler which is run every time an HTTPS URL is hit.
  ///
  /// The event handler is called with Express Request and Response objects as its
  /// only arguments.
  external HttpsFunction onRequest(
      HttpsOptions options, HttpRequestListener handler);
}

/// Gen2 extension
extension FirebaseFunctionsExtGen2Js on FirebaseFunctions {
  /// Firestore gen2
  external FirestoreFunctionsGen2Js get firestore;
}

/// The context in which an event occurred.
///
/// An EventContext describes:
///
///   * The time an event occurred.
///   * A unique identifier of the event.
///   * The resource on which the event occurred, if applicable.
///   * Authorization of the request that triggered the event, if applicable
///     and available.
@JS()
@anonymous
@staticInterop
abstract class FirestoreEventGen2Js<T> extends CloudEventGen2Js<T> {}

@JS()
@anonymous
@staticInterop
abstract class FirestoreFunctionsGen2Js {}

/// The Cloud Function type for firestore triggers.
typedef FirestoreTriggerCloudFunction<T> = dynamic Function(dynamic data);

extension FirestoreFunctionsGen2JsExt on FirestoreFunctionsGen2Js {
  /// Registers a function that triggers on Cloud Firestore write events to
  /// the [document].
  external dynamic onDocumentWritten(
      String path,
      dynamic Function(FirestoreEventGen2Js<Change<DocumentSnapshot>> event)
          handle);
}

//  * A `CloudEventBase` is the base of a cross-platform format for encoding a serverless event.
@JS()
@anonymous
@staticInterop
abstract class CloudEventGen2Js<T> {}

extension CloudEventGen2JsExt<T> on CloudEventGen2Js<T> {
  external T get data;
}
