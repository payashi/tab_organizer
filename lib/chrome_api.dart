// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'dart:convert';
import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'models/chrome_tab.dart';

@JS('queryTabs')
external Object _queryTabs(QueryInfo info);

Future<List<ChromeTab>> queryTabs(QueryInfo info) async {
  final response = await promiseToFuture<String>(_queryTabs(info));
  final tabs = (json.decode(response) as List)
      .map<ChromeTab>((i) => ChromeTab.fromJson(i))
      .toList();
  return tabs;
}

@JS('chrome.tabs.highlight')
external Object _highlightTabs(HighlightInfo info);

Future<void> hightlightTabs(HighlightInfo info) async {
  _highlightTabs(info);
}

@JS('chrome.tabs.move')
external Object _moveTabs(
  List<num> tabIds,
  MoveProperties properties,
);

Future<void> moveTabs(List<num> tabIds, MoveProperties properties) async {
  _moveTabs(tabIds, properties);
}

@JS('chrome.tabs.group')
external Object _groupTabs(GroupOptions options);

Future<num> groupTabs(GroupOptions options) async {
  final groupId = await promiseToFuture<num>(_groupTabs(options));
  return groupId;
}

@JS('chrome.windows.update')
external Object _updateWindows(
  num windowId,
  UpdateInfo info,
);

Future<void> updateWindows(num windowId, UpdateInfo info) async {
  _updateWindows(windowId, info);
}

@JS()
@anonymous
class QueryInfo {
  external bool? get active;
  external bool? get currentWindow;
  external bool? get highlited;

  external num? get index;
  external num? get groupId;
  external num? get windowId;

  external String? get title;
  external String? get url;

  external factory QueryInfo({
    bool? active,
    bool? currentWindow,
    bool? highlighted,
    num? index,
    num? groupId,
    num? windowId,
    String? title,
    String? url,
  });
}

@JS()
@anonymous
class HighlightInfo {
  external List<num> get tabs; // tab indicies to highlight
  external num? get windowId; // the window that contains the tabs

  external factory HighlightInfo({List<num> tabs, num? windowId});
}

@JS()
@anonymous
class MoveProperties {
  external num get index;
  external num? get windowId;

  external factory MoveProperties({num index, num? windowId});
}

@JS()
@anonymous
class GroupOptions {
  external CreateProperties? properties;
  external num? groupId;
  external List<num> tabIds;

  external factory GroupOptions(
      {CreateProperties? properties, num? groupId, List<num> tabIds});
}

@JS()
@anonymous
class CreateProperties {
  external num? windowId;

  external factory CreateProperties({num? windowId});
}

@JS()
@anonymous
class UpdateInfo {
  external bool? drawAttention;
  external bool? focused;

  external factory UpdateInfo({bool? drawAttention, bool? focused});
}
