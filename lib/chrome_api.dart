// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'dart:convert';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:tab_organizer/providers/category_map_notifier.dart';
import 'models/chrome_tab.dart';

@JS('queryTabs')
external Object _queryTabs(TabsQueryInfo info);

Future<CategoryMap> queryTabs(TabsQueryInfo info) async {
  final response = await promiseToFuture<String>(_queryTabs(info));
  final tabs = (json.decode(response) as List)
      .map<ChromeTab>((i) => ChromeTab.fromJson(i))
      .toList();

  // Convert List<ChromeTab> to Map<num, List<ChromeTab>>
  CategoryMap categoryMap = <num, List<ChromeTab>>{};
  for (final tab in tabs) {
    categoryMap.putIfAbsent(tab.groupId, () => []).add(tab);
  }

  return categoryMap;
}

@JS('chrome.tabs.highlight')
external Object _highlightTabs(TabsHighlightInfo info);

Future<void> hightlightTabs(TabsHighlightInfo info) async {
  _highlightTabs(info);
}

@JS('chrome.tabs.move')
external Object _moveTabs(
  List<num> tabIds,
  TabsMoveProperties properties,
);

Future<void> moveTabs(List<num> tabIds, TabsMoveProperties properties) async {
  _moveTabs(tabIds, properties);
}

@JS('chrome.tabs.group')
external Object _groupTabs(TabsGroupOptions options);

Future<num> groupTabs(TabsGroupOptions options) async {
  final groupId = await promiseToFuture<num>(_groupTabs(options));
  return groupId;
}

@JS('chrome.windows.update')
external Object _updateWindows(
  num windowId,
  WindowsUpdateInfo info,
);

Future<void> updateWindows(num windowId, WindowsUpdateInfo info) async {
  _updateWindows(windowId, info);
}

@JS('chrome.tabGroups.update')
external Object _updateTabGroups(
  num groupId,
  TabGroupsUpdateProperties properties,
);

Future<void> updateTabGroups(
    num groupId, TabGroupsUpdateProperties properties) async {
  _updateTabGroups(groupId, properties);
}

@JS('chrome.tabGroups.move')
external Object _moveTabGroups(
  num groupId,
  TabGroupsMoveProperties properties,
);

Future<void> moveTabGroups(
    num groupId, TabGroupsMoveProperties properties) async {
  _moveTabGroups(groupId, properties);
}

@JS()
@anonymous
class TabsQueryInfo {
  external bool? get active;
  external bool? get currentWindow;
  external bool? get highlited;

  external num? get index;
  external num? get groupId;
  external num? get windowId;

  external String? get title;
  external String? get url;

  external factory TabsQueryInfo({
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
class TabsHighlightInfo {
  external List<num> get tabs; // tab indicies to highlight
  external num? get windowId; // the window that contains the tabs

  external factory TabsHighlightInfo({List<num> tabs, num? windowId});
}

@JS()
@anonymous
class TabsMoveProperties {
  external num get index;
  external num? get windowId;

  external factory TabsMoveProperties({num index, num? windowId});
}

@JS()
@anonymous
class TabsGroupOptions {
  external TabsGroupOptionsCreateProperties? properties;
  external num? groupId;
  external List<num> tabIds;

  external factory TabsGroupOptions(
      {TabsGroupOptionsCreateProperties? properties,
      num? groupId,
      List<num> tabIds});
}

@JS()
@anonymous
class TabsGroupOptionsCreateProperties {
  external num? windowId;

  external factory TabsGroupOptionsCreateProperties({num? windowId});
}

@JS()
@anonymous
class WindowsUpdateInfo {
  external bool? drawAttention;
  external bool? focused;

  external factory WindowsUpdateInfo({bool? drawAttention, bool? focused});
}

@JS()
@anonymous
class TabGroupsUpdateProperties {
  external bool? collapsed;
  external String? color;
  external String? title;

  external factory TabGroupsUpdateProperties({
    bool? collapsed,
    String? color,
    String? title,
  });
}

@JS()
@anonymous
class TabGroupsMoveProperties {
  external num index;
  external num? windowId;

  external factory TabGroupsMoveProperties({
    num index,
    num? windowId,
  });
}
