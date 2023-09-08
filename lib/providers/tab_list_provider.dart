import 'dart:js_interop';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dio/dio.dart';

const kKlazifyEndpoint = 'https://www.klazify.com';
final apiKey = dotenv.get('KLAZIFY_API_ACCESS_KEY');

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
      '$kKlazifyEndpoint/api/categorize',
      data: {'url': tabs[0].url},
      options: Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'cache-control': 'no-cache',
      }),
    );

    if (response.statusCode == 200) {
      // Fill Category field to each Url
    } else {
      // state = AsyncValue.error(error, stackTrace)
    }
  }
}

final tabListProvider =
    StateNotifierProvider<TabListNotifier, AsyncValue<List<ChromeTab>>>(
        (ref) => TabListNotifier());
