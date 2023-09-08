// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chrome_tab.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChromeTab _$ChromeTabFromJson(Map<String, dynamic> json) {
  return _ChromeTab.fromJson(json);
}

/// @nodoc
mixin _$ChromeTab {
  bool get active => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get windowId => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get favIconUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChromeTabCopyWith<ChromeTab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChromeTabCopyWith<$Res> {
  factory $ChromeTabCopyWith(ChromeTab value, $Res Function(ChromeTab) then) =
      _$ChromeTabCopyWithImpl<$Res, ChromeTab>;
  @useResult
  $Res call(
      {bool active,
      int groupId,
      int id,
      int windowId,
      int index,
      String favIconUrl,
      String title,
      String url});
}

/// @nodoc
class _$ChromeTabCopyWithImpl<$Res, $Val extends ChromeTab>
    implements $ChromeTabCopyWith<$Res> {
  _$ChromeTabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? groupId = null,
    Object? id = null,
    Object? windowId = null,
    Object? index = null,
    Object? favIconUrl = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      favIconUrl: null == favIconUrl
          ? _value.favIconUrl
          : favIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChromeTabCopyWith<$Res> implements $ChromeTabCopyWith<$Res> {
  factory _$$_ChromeTabCopyWith(
          _$_ChromeTab value, $Res Function(_$_ChromeTab) then) =
      __$$_ChromeTabCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      int groupId,
      int id,
      int windowId,
      int index,
      String favIconUrl,
      String title,
      String url});
}

/// @nodoc
class __$$_ChromeTabCopyWithImpl<$Res>
    extends _$ChromeTabCopyWithImpl<$Res, _$_ChromeTab>
    implements _$$_ChromeTabCopyWith<$Res> {
  __$$_ChromeTabCopyWithImpl(
      _$_ChromeTab _value, $Res Function(_$_ChromeTab) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? groupId = null,
    Object? id = null,
    Object? windowId = null,
    Object? index = null,
    Object? favIconUrl = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$_ChromeTab(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      favIconUrl: null == favIconUrl
          ? _value.favIconUrl
          : favIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChromeTab implements _ChromeTab {
  const _$_ChromeTab(
      {required this.active,
      required this.groupId,
      required this.id,
      required this.windowId,
      required this.index,
      this.favIconUrl = '',
      this.title = '',
      this.url = ''});

  factory _$_ChromeTab.fromJson(Map<String, dynamic> json) =>
      _$$_ChromeTabFromJson(json);

  @override
  final bool active;
  @override
  final int groupId;
  @override
  final int id;
  @override
  final int windowId;
  @override
  final int index;
  @override
  @JsonKey()
  final String favIconUrl;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'ChromeTab(active: $active, groupId: $groupId, id: $id, windowId: $windowId, index: $index, favIconUrl: $favIconUrl, title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChromeTab &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.windowId, windowId) ||
                other.windowId == windowId) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.favIconUrl, favIconUrl) ||
                other.favIconUrl == favIconUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, active, groupId, id, windowId,
      index, favIconUrl, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChromeTabCopyWith<_$_ChromeTab> get copyWith =>
      __$$_ChromeTabCopyWithImpl<_$_ChromeTab>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChromeTabToJson(
      this,
    );
  }
}

abstract class _ChromeTab implements ChromeTab {
  const factory _ChromeTab(
      {required final bool active,
      required final int groupId,
      required final int id,
      required final int windowId,
      required final int index,
      final String favIconUrl,
      final String title,
      final String url}) = _$_ChromeTab;

  factory _ChromeTab.fromJson(Map<String, dynamic> json) =
      _$_ChromeTab.fromJson;

  @override
  bool get active;
  @override
  int get groupId;
  @override
  int get id;
  @override
  int get windowId;
  @override
  int get index;
  @override
  String get favIconUrl;
  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ChromeTabCopyWith<_$_ChromeTab> get copyWith =>
      throw _privateConstructorUsedError;
}
