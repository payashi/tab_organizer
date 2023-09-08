import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dio/dio.dart';

final apiUrl = dotenv.get('API_BASE_URL');

typedef ResponseType = Map<String, List<String>>;

class TabListNotifier extends StateNotifier<AsyncValue<List<ChromeTab>>> {
  static final dio = Dio();

  TabListNotifier() : super(const AsyncValue.loading()) {
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

    // The state must be List<ChromeTab> when calling API
    final tabs = state.value!;

    // Due to Klazify API's specifications, only one url can be classified per call
    // Use another API or iterate through all the urls
    Response response = await dio.post(
      '$apiUrl/classify',
      // data: {'urls': tabs.map((tab) => tab.url)},
      data: {
        'urls': ['https://www.google.com']
      },
      options: Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // 'cache-control': 'no-cache',
      }),
    );

    debugPrint('statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      // Fill Category field to each Url
      debugPrint(jsonEncode(response.data));
    } else {
      // state = AsyncValue.error(error, stackTrace)
    }
  }
}

final tabListProvider =
    StateNotifierProvider<TabListNotifier, AsyncValue<List<ChromeTab>>>(
        (ref) => TabListNotifier());
