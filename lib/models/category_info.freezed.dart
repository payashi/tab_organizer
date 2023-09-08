// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryInfo _$CategoryInfoFromJson(Map<String, dynamic> json) {
  return _CategoryInfo.fromJson(json);
}

/// @nodoc
mixin _$CategoryInfo {
  Map<int, List<ChromeTab>> get tabs =>
      throw _privateConstructorUsedError; // Use groupId as Key
  Map<int, String> get groupTitles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryInfoCopyWith<CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfoCopyWith<$Res> {
  factory $CategoryInfoCopyWith(
          CategoryInfo value, $Res Function(CategoryInfo) then) =
      _$CategoryInfoCopyWithImpl<$Res, CategoryInfo>;
  @useResult
  $Res call({Map<int, List<ChromeTab>> tabs, Map<int, String> groupTitles});
}

/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res, $Val extends CategoryInfo>
    implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? groupTitles = null,
  }) {
    return _then(_value.copyWith(
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ChromeTab>>,
      groupTitles: null == groupTitles
          ? _value.groupTitles
          : groupTitles // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryInfoCopyWith<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  factory _$$_CategoryInfoCopyWith(
          _$_CategoryInfo value, $Res Function(_$_CategoryInfo) then) =
      __$$_CategoryInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, List<ChromeTab>> tabs, Map<int, String> groupTitles});
}

/// @nodoc
class __$$_CategoryInfoCopyWithImpl<$Res>
    extends _$CategoryInfoCopyWithImpl<$Res, _$_CategoryInfo>
    implements _$$_CategoryInfoCopyWith<$Res> {
  __$$_CategoryInfoCopyWithImpl(
      _$_CategoryInfo _value, $Res Function(_$_CategoryInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? groupTitles = null,
  }) {
    return _then(_$_CategoryInfo(
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ChromeTab>>,
      groupTitles: null == groupTitles
          ? _value._groupTitles
          : groupTitles // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryInfo implements _CategoryInfo {
  const _$_CategoryInfo(
      {required final Map<int, List<ChromeTab>> tabs,
      required final Map<int, String> groupTitles})
      : _tabs = tabs,
        _groupTitles = groupTitles;

  factory _$_CategoryInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryInfoFromJson(json);

  final Map<int, List<ChromeTab>> _tabs;
  @override
  Map<int, List<ChromeTab>> get tabs {
    if (_tabs is EqualUnmodifiableMapView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tabs);
  }

// Use groupId as Key
  final Map<int, String> _groupTitles;
// Use groupId as Key
  @override
  Map<int, String> get groupTitles {
    if (_groupTitles is EqualUnmodifiableMapView) return _groupTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_groupTitles);
  }

  @override
  String toString() {
    return 'CategoryInfo(tabs: $tabs, groupTitles: $groupTitles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryInfo &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality()
                .equals(other._groupTitles, _groupTitles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_groupTitles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      __$$_CategoryInfoCopyWithImpl<_$_CategoryInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryInfoToJson(
      this,
    );
  }
}

abstract class _CategoryInfo implements CategoryInfo {
  const factory _CategoryInfo(
      {required final Map<int, List<ChromeTab>> tabs,
      required final Map<int, String> groupTitles}) = _$_CategoryInfo;

  factory _CategoryInfo.fromJson(Map<String, dynamic> json) =
      _$_CategoryInfo.fromJson;

  @override
  Map<int, List<ChromeTab>> get tabs;
  @override // Use groupId as Key
  Map<int, String> get groupTitles;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
