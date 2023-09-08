// ignore_for_file: depend_on_referenced_packages

@JS()
library chrome_api;

import 'dart:convert';

import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:tab_organizer/models/category_info.dart';
import 'models/chrome_tab.dart';

@JS('queryTabs')
external Object _queryTabs(TabsQueryInfo info);

Future<CategoryInfo> queryTabs(TabsQueryInfo info) async {
  final response = await promiseToFuture<String>(_queryTabs(info));
  final flatTabs = (json.decode(response) as List)
      .map<ChromeTab>((i) => ChromeTab.fromJson(i))
      .toList();

  final tabs = <int, List<ChromeTab>>{};
  for (final tab in flatTabs) {
    tabs.putIfAbsent(tab.groupId, () => []).add(tab);
  }

  final titles = <int, String>{};
  for (final groupId in tabs.keys) {
    String title;
    if (groupId == -1) {
      title = 'Ungrouped';
    } else {
      title = await getTabGroupTitle(groupId);
    }
    titles.putIfAbsent(groupId, () => title);
  }

  return CategoryInfo(tabs: tabs, groupTitles: titles);
}

@JS('getTabGroupTitle')
external Object _getTabGroupTitle(int groupId);

Future<String> getTabGroupTitle(int groupId) async {
  return await promiseToFuture<String>(_getTabGroupTitle(groupId));
}

@JS('chrome.tabs.highlight')
external Object _highlightTabs(TabsHighlightInfo info);

Future<void> hightlightTabs(TabsHighlightInfo info) async {
  _highlightTabs(info);
}

@JS('chrome.tabs.move')
external Object _moveTabs(
  List<int> tabIds,
  TabsMoveProperties properties,
);

Future<void> moveTabs(List<int> tabIds, TabsMoveProperties properties) async {
  _moveTabs(tabIds, properties);
}

@JS('chrome.tabs.group')
external Object _groupTabs(TabsGroupOptions options);

Future<int> groupTabs(TabsGroupOptions options) async {
  final groupId = await promiseToFuture<int>(_groupTabs(options));
  return groupId;
}

@JS('chrome.windows.update')
external Object _updateWindows(
  int windowId,
  WindowsUpdateInfo info,
);

Future<void> updateWindows(int windowId, WindowsUpdateInfo info) async {
  _updateWindows(windowId, info);
}

@JS('chrome.tabGroups.update')
external Object _updateTabGroups(
  int groupId,
  TabGroupsUpdateProperties properties,
);

Future<void> updateTabGroups(
    int groupId, TabGroupsUpdateProperties properties) async {
  _updateTabGroups(groupId, properties);
}

@JS('chrome.tabGroups.move')
external Object _moveTabGroups(
  int groupId,
  TabGroupsMoveProperties properties,
);

Future<void> moveTabGroups(
    int groupId, TabGroupsMoveProperties properties) async {
  _moveTabGroups(groupId, properties);
}

@JS()
@anonymous
class TabsQueryInfo {
  external bool? get active;
  external bool? get currentWindow;
  external bool? get highlited;

  external int? get index;
  external int? get groupId;
  external int? get windowId;

  external String? get title;
  external String? get url;

  external factory TabsQueryInfo({
    bool? active,
    bool? currentWindow,
    bool? highlighted,
    int? index,
    int? groupId,
    int? windowId,
    String? title,
    String? url,
  });
}

@JS()
@anonymous
class TabsHighlightInfo {
  external List<int> get tabs; // tab indicies to highlight
  external int? get windowId; // the window that contains the tabs

  external factory TabsHighlightInfo({List<int> tabs, int? windowId});
}

@JS()
@anonymous
class TabsMoveProperties {
  external int get index;
  external int? get windowId;

  external factory TabsMoveProperties({int index, int? windowId});
}

@JS()
@anonymous
class TabsGroupOptions {
  external TabsGroupOptionsCreateProperties? createProperties;
  external int? groupId;
  external List<int> tabIds;

  external factory TabsGroupOptions(
      {TabsGroupOptionsCreateProperties? createProperties,
      int? groupId,
      List<int> tabIds});
}

@JS()
@anonymous
class TabsGroupOptionsCreateProperties {
  external int? windowId;

  external factory TabsGroupOptionsCreateProperties({int? windowId});
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
  external int index;
  external int? windowId;

  external factory TabGroupsMoveProperties({
    int index,
    int? windowId,
  });
}
