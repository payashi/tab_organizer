import 'package:freezed_annotation/freezed_annotation.dart';

import 'chrome_tab.dart';

part 'category_info.freezed.dart';
part 'category_info.g.dart';

@freezed
class CategoryInfo with _$CategoryInfo {
  const factory CategoryInfo({
    required Map<int, List<ChromeTab>> tabs, // Use groupId as Key
    required Map<int, String> groupTitles, // Use groupId as Key
  }) = _CategoryInfo;

  factory CategoryInfo.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoFromJson(json);
}
