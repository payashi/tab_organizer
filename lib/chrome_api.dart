// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'dart:convert';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'models/chrome_tab.dart';

@JS('getUrl')
external Object _getUrl();

Future<String> getUrl() async {
  return promiseToFuture<String>(_getUrl());
}

@JS('getTabs')
external Object _getTabs(QueryOptions options);

Future<List<ChromeTab>> getTabs(QueryOptions options) async {
  final response = await promiseToFuture<String>(_getTabs(options));
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
