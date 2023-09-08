// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_tab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChromeTab _$$_ChromeTabFromJson(Map<String, dynamic> json) => _$_ChromeTab(
      active: json['active'] as bool,
      groupId: json['groupId'] as int,
      id: json['id'] as int,
      windowId: json['windowId'] as int,
      index: json['index'] as int,
      favIconUrl: json['favIconUrl'] as String? ?? '',
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChromeTabToJson(_$_ChromeTab instance) =>
    <String, dynamic>{
      'active': instance.active,
      'groupId': instance.groupId,
      'id': instance.id,
      'windowId': instance.windowId,
      'index': instance.index,
      'favIconUrl': instance.favIconUrl,
      'title': instance.title,
      'url': instance.url,
    };
