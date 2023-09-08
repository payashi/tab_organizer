import 'dart:js_interop';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dio/dio.dart';

final apiUrl = dotenv.get('API_BASE_URL');

typedef CategoryMap = Map<num, List<ChromeTab>>;

class CategoryMapNotifier extends StateNotifier<AsyncValue<CategoryMap>> {
  static final dio = Dio();

  CategoryMapNotifier() : super(const AsyncValue.loading()) {
    fetchTabs();
  }

  Future<void> fetchTabs() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => queryTabs(TabsQueryInfo()));
  }

  Future<void> classify() async {
    if (state.isUndefinedOrNull) {
      return;
    }

    // The state must be CategoryMap when calling API
    final tabs = state.value!.entries.fold<List<ChromeTab>>(
      [],
      (acc, el) => [...acc, ...el.value],
    );

    state = const AsyncValue.loading();

    try {
      Response<Map<String, dynamic>> response = await dio.post(
        '$apiUrl/classify',
        data: {'urls': tabs.map((tab) => tab.url).toList()},
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      final Map<String, List<String>> results =
          response.data!.map((k, v) => MapEntry(k, v));

      late final num unclassified;

      // Fill Category field to each Url
      for (var entry in results.entries) {
        final filteredTabs =
            tabs.where((tab) => entry.value.contains(tab.url)).toList();
        filteredTabs.sort((a, b) => a.url.compareTo(b.url));

        final tabIds = filteredTabs.map((tab) => tab.id).toList();
        final groupId = await groupTabs(TabsGroupOptions(
          tabIds: tabIds,
          properties: TabsGroupOptionsCreateProperties(
            windowId: filteredTabs.first.windowId,
          ),
        ));
        await updateTabGroups(
          groupId,
          TabGroupsUpdateProperties(title: entry.key),
        );
        if (entry.key == 'Unclassified') {
          unclassified = groupId;
        }
      }
      await moveTabGroups(unclassified, TabGroupsMoveProperties(index: -1));
      await fetchTabs();
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}

final categoryMapNotifier =
    StateNotifierProvider<CategoryMapNotifier, AsyncValue<CategoryMap>>(
        (ref) => CategoryMapNotifier());
