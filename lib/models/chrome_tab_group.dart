import 'package:freezed_annotation/freezed_annotation.dart';

part 'chrome_tab_group.freezed.dart';
part 'chrome_tab_group.g.dart';

enum TabGroupColor {
  grey,
  blue,
  red,
  yellow,
  green,
  pink,
  purple,
  cyan,
  orange,
}

@freezed
class ChromeTabGroup with _$ChromeTabGroup {
  const factory ChromeTabGroup({
    required bool collapsed,
    required TabGroupColor color,
    required num id,
    required num windowId,
    @Default('') String title,
  }) = _ChromeTabGroup;

  factory ChromeTabGroup.fromJson(Map<String, dynamic> json) =>
      _$ChromeTabGroupFromJson(json);
}
