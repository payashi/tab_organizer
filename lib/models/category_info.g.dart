// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryInfo _$$_CategoryInfoFromJson(Map<String, dynamic> json) =>
    _$_CategoryInfo(
      tabs: (json['tabs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => ChromeTab.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      groupTitles: (json['groupTitles'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$$_CategoryInfoToJson(_$_CategoryInfo instance) =>
    <String, dynamic>{
      'tabs': instance.tabs.map((k, e) => MapEntry(k.toString(), e)),
      'groupTitles':
          instance.groupTitles.map((k, e) => MapEntry(k.toString(), e)),
    };
