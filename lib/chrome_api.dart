@JS()
library chrome_api;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('getUrl')
external Object _getUrl();

Future<String> getUrl() async {
  return promiseToFuture<String>(_getUrl());
}
