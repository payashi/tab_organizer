import 'package:freezed_annotation/freezed_annotation.dart';

part 'chrome_tab.freezed.dart';
part 'chrome_tab.g.dart';

@freezed
class ChromeTab with _$ChromeTab {
  const factory ChromeTab({
    required bool active,
    required int groupId,
    required int id,
    required int windowId,
    required int index,
    @Default('') String favIconUrl,
    @Default('') String title,
    @Default('') String url,
  }) = _ChromeTab;

  factory ChromeTab.fromJson(Map<String, dynamic> json) =>
      _$ChromeTabFromJson(json);
}
