import 'package:node_interop/node.dart';

import 'bindings.dart' as js;

final moduleFirebaseFunctions =
    require('firebase-functions/v1') as js.FirebaseFunctions;
