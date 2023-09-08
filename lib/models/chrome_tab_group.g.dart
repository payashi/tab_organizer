// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_tab_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChromeTabGroup _$$_ChromeTabGroupFromJson(Map<String, dynamic> json) =>
    _$_ChromeTabGroup(
      collapsed: json['collapsed'] as bool,
      color: $enumDecode(_$TabGroupColorEnumMap, json['color']),
      id: json['id'] as num,
      windowId: json['windowId'] as num,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChromeTabGroupToJson(_$_ChromeTabGroup instance) =>
    <String, dynamic>{
      'collapsed': instance.collapsed,
      'color': _$TabGroupColorEnumMap[instance.color]!,
      'id': instance.id,
      'windowId': instance.windowId,
      'title': instance.title,
    };

const _$TabGroupColorEnumMap = {
  TabGroupColor.grey: 'grey',
  TabGroupColor.blue: 'blue',
  TabGroupColor.red: 'red',
  TabGroupColor.yellow: 'yellow',
  TabGroupColor.green: 'green',
  TabGroupColor.pink: 'pink',
  TabGroupColor.purple: 'purple',
  TabGroupColor.cyan: 'cyan',
  TabGroupColor.orange: 'orange',
};
