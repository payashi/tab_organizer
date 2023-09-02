// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'dart:convert';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'models/chrome_tab.dart';

@JS('queryTabs')
external Object _queryTabs(QueryOptions options);

Future<List<ChromeTab>> queryTabs(QueryOptions options) async {
  final response = await promiseToFuture<String>(_queryTabs(options));
  final tabs = (json.decode(response) as List)
      .map<ChromeTab>((i) => ChromeTab.fromJson(i))
      .toList();
  return tabs;
}

@JS()
@anonymous
class QueryOptions {
  external bool get active;
  external bool get currentWindow;
  external bool get highlited;

  external num get index;
  external num get groupId;
  external num get windowId;

  external String get title;
  external String get url;

  external factory QueryOptions({
    bool active,
    bool currentWindow,
    bool highlighted,
    num index,
    num groupId,
    num windowId,
    String title,
    String url,
  });
}
