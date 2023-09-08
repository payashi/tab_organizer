// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chrome_tab_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChromeTabGroup _$ChromeTabGroupFromJson(Map<String, dynamic> json) {
  return _ChromeTabGroup.fromJson(json);
}

/// @nodoc
mixin _$ChromeTabGroup {
  bool get collapsed => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get windowId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChromeTabGroupCopyWith<ChromeTabGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChromeTabGroupCopyWith<$Res> {
  factory $ChromeTabGroupCopyWith(
          ChromeTabGroup value, $Res Function(ChromeTabGroup) then) =
      _$ChromeTabGroupCopyWithImpl<$Res, ChromeTabGroup>;
  @useResult
  $Res call({bool collapsed, String color, int id, int windowId, String title});
}

/// @nodoc
class _$ChromeTabGroupCopyWithImpl<$Res, $Val extends ChromeTabGroup>
    implements $ChromeTabGroupCopyWith<$Res> {
  _$ChromeTabGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collapsed = null,
    Object? color = null,
    Object? id = null,
    Object? windowId = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChromeTabGroupCopyWith<$Res>
    implements $ChromeTabGroupCopyWith<$Res> {
  factory _$$_ChromeTabGroupCopyWith(
          _$_ChromeTabGroup value, $Res Function(_$_ChromeTabGroup) then) =
      __$$_ChromeTabGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool collapsed, String color, int id, int windowId, String title});
}

/// @nodoc
class __$$_ChromeTabGroupCopyWithImpl<$Res>
    extends _$ChromeTabGroupCopyWithImpl<$Res, _$_ChromeTabGroup>
    implements _$$_ChromeTabGroupCopyWith<$Res> {
  __$$_ChromeTabGroupCopyWithImpl(
      _$_ChromeTabGroup _value, $Res Function(_$_ChromeTabGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collapsed = null,
    Object? color = null,
    Object? id = null,
    Object? windowId = null,
    Object? title = null,
  }) {
    return _then(_$_ChromeTabGroup(
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChromeTabGroup implements _ChromeTabGroup {
  const _$_ChromeTabGroup(
      {required this.collapsed,
      required this.color,
      required this.id,
      required this.windowId,
      this.title = ''});

  factory _$_ChromeTabGroup.fromJson(Map<String, dynamic> json) =>
      _$$_ChromeTabGroupFromJson(json);

  @override
  final bool collapsed;
  @override
  final String color;
  @override
  final int id;
  @override
  final int windowId;
  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'ChromeTabGroup(collapsed: $collapsed, color: $color, id: $id, windowId: $windowId, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChromeTabGroup &&
            (identical(other.collapsed, collapsed) ||
                other.collapsed == collapsed) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.windowId, windowId) ||
                other.windowId == windowId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, collapsed, color, id, windowId, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChromeTabGroupCopyWith<_$_ChromeTabGroup> get copyWith =>
      __$$_ChromeTabGroupCopyWithImpl<_$_ChromeTabGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChromeTabGroupToJson(
      this,
    );
  }
}

abstract class _ChromeTabGroup implements ChromeTabGroup {
  const factory _ChromeTabGroup(
      {required final bool collapsed,
      required final String color,
      required final int id,
      required final int windowId,
      final String title}) = _$_ChromeTabGroup;

  factory _ChromeTabGroup.fromJson(Map<String, dynamic> json) =
      _$_ChromeTabGroup.fromJson;

  @override
  bool get collapsed;
  @override
  String get color;
  @override
  int get id;
  @override
  int get windowId;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ChromeTabGroupCopyWith<_$_ChromeTabGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
