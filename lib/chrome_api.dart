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
external Object _getTabs();

// See Also: https://medium.com/teamarimac/working-with-list-of-json-objects-flutter-json-serializable-db1b6e1805aa
Future<List<ChromeTab>> getTabs() async {
  final response = await promiseToFuture<String>(_getTabs());
  final tabs = (json.decode(response) as List)
      .map<ChromeTab>((i) => ChromeTab.fromJson(i))
      .toList();
  return tabs;
  // return const [
  //   ChromeTab(
  //     active: true,
  //     groupId: 0,
  //     id: 0,
  //     index: 0,
  //   ),
  // ];
}
