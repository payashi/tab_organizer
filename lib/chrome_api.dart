// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('getUrl')
external Object _getUrl();

Future<String> getUrl() async {
  return promiseToFuture<String>(_getUrl());
}

@JS('getTabs')
external Object _getTabs();

Future<String> getTabs() async {
  // TODO: Cast String to List<ChromeTab> with ChromeTab.fromJson
  // See Also: https://medium.com/teamarimac/working-with-list-of-json-objects-flutter-json-serializable-db1b6e1805aa
  final raw = await promiseToFuture<String>(_getTabs());
  return raw;
}
