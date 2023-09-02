// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_tab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChromeTab _$$_ChromeTabFromJson(Map<String, dynamic> json) => _$_ChromeTab(
      active: json['active'] as bool,
      groupId: json['groupId'] as num,
      id: json['id'] as num,
      index: json['index'] as num,
      favIconUrl: json['favIconUrl'] as String? ?? '',
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChromeTabToJson(_$_ChromeTab instance) =>
    <String, dynamic>{
      'active': instance.active,
      'groupId': instance.groupId,
      'id': instance.id,
      'index': instance.index,
      'favIconUrl': instance.favIconUrl,
      'title': instance.title,
      'url': instance.url,
    };
