import 'dart:async';

import 'package:firebase_functions_interop/firebase_functions_interop.dart';
import 'package:js/js.dart' as js;
import 'package:js/js_util.dart' as js;
import 'package:node_interop/node.dart';
import 'package:node_interop/util.dart';

import 'bindings.dart' as js;
// ignore: unused_import
import 'bindings_gen2.dart' as gen2_js;

export 'interop_gen2.dart' show FirebaseFunctionsGen2;

@Deprecated('temporary')
void devPrint(Object? object) {
  print(object);
}

final _moduleV2 = require('firebase-functions/v2') as js.FirebaseFunctions;

/// Main library object which can be used to create and register Firebase
/// Cloud functions v2
final FirebaseFunctionsGen2 functionsGen2 = FirebaseFunctionsGen2(_moduleV2);

/// Global namespace for Firebase Cloud Functions functionality.
///
/// Use [functionsGen2] as a singleton instance of this class to export function
/// triggers.
class FirebaseFunctionsGen2 {
  final js.FirebaseFunctions jsFunctions;

  /// HTTPS functions.
  late final HttpsFunctions https = HttpsFunctions(jsFunctions);

  /// Firestore functions.
  late final FirestoreFunctionsGen2 firestore = FirestoreFunctionsGen2(this);

  FirebaseFunctionsGen2(js.FirebaseFunctions functions)
      : jsFunctions = functions;

  /// Export [function] under specified [key].
  ///
  /// For HTTPS functions the [key] defines URL path prefix.
  void operator []=(String key, Object function) {
    assert(function is js.HttpsFunction || function is js.CloudFunction);
    setExport(key, function);
  }
}

class FirestoreEventGen2<T> {
  final T data;

  FirestoreEventGen2(this.data);
}

typedef FirestoreEventHandlerGen2<T> = FutureOr<void> Function(
    FirestoreEventGen2<T> data);

class FirestoreFunctionsGen2 {
  final FirebaseFunctionsGen2 functions;
  late final gen2_js.FirestoreFunctionsGen2Js _js;

  FirestoreFunctionsGen2(this.functions) {
    _js = gen2_js.FirebaseFunctionsExtGen2Js(functions.jsFunctions).firestore;
  }

  dynamic onDocumentWritten(String path,
      FirestoreEventHandlerGen2<Change<DocumentSnapshot>> handler) {
    dynamic wrapper(
        gen2_js.FirestoreEventGen2Js<js.Change<js.DocumentSnapshot>> event) {
      /*
      try {
        print('before: ${event.data.before.data()}');
      } catch (_) {}
      try {
        print('after: ${event.data.after.data()}');
      } catch (_) {}
       */
      _handleChangeEvent(event.data, handler);
    }

    return _js.onDocumentWritten(path, js.allowInterop(wrapper));
  }

  dynamic _handleChangeEvent(js.Change<js.DocumentSnapshot> data,
      FirestoreEventHandlerGen2<Change<DocumentSnapshot>> handler) {
    final firestore = Firestore(data.after.ref.firestore);
    var after = DocumentSnapshot(data.after, firestore);
    var before = DocumentSnapshot(data.before, firestore);

    var result = handler(
        FirestoreEventGen2<Change<DocumentSnapshot>>(Change(after, before)));
    if (result is Future) {
      return futureToPromise(result);
    }
    // See: https://stackoverflow.com/questions/47128440/google-firebase-errorfunction-returned-undefined-expected-promise-or-value
    return 0;
  }
}
