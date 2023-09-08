// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_tab_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChromeTabGroup _$$_ChromeTabGroupFromJson(Map<String, dynamic> json) =>
    _$_ChromeTabGroup(
      collapsed: json['collapsed'] as bool,
      color: json['color'] as String,
      id: json['id'] as int,
      windowId: json['windowId'] as int,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChromeTabGroupToJson(_$_ChromeTabGroup instance) =>
    <String, dynamic>{
      'collapsed': instance.collapsed,
      'color': instance.color,
      'id': instance.id,
      'windowId': instance.windowId,
      'title': instance.title,
    };
