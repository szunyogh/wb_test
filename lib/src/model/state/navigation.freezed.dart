// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavigationState {
  RootPage get root => throw _privateConstructorUsedError;
  MenuPage get menu => throw _privateConstructorUsedError;
  StackList<MobileScreen>? get screens => throw _privateConstructorUsedError;
  Map<String, dynamic> get argument => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {RootPage root,
      MenuPage menu,
      StackList<MobileScreen>? screens,
      Map<String, dynamic> argument,
      String id});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? root = null,
    Object? menu = null,
    Object? screens = freezed,
    Object? argument = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as RootPage,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuPage,
      screens: freezed == screens
          ? _value.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as StackList<MobileScreen>?,
      argument: null == argument
          ? _value.argument
          : argument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationStateImplCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationStateImplCopyWith(_$NavigationStateImpl value,
          $Res Function(_$NavigationStateImpl) then) =
      __$$NavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RootPage root,
      MenuPage menu,
      StackList<MobileScreen>? screens,
      Map<String, dynamic> argument,
      String id});
}

/// @nodoc
class __$$NavigationStateImplCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationStateImpl>
    implements _$$NavigationStateImplCopyWith<$Res> {
  __$$NavigationStateImplCopyWithImpl(
      _$NavigationStateImpl _value, $Res Function(_$NavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? root = null,
    Object? menu = null,
    Object? screens = freezed,
    Object? argument = null,
    Object? id = null,
  }) {
    return _then(_$NavigationStateImpl(
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as RootPage,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuPage,
      screens: freezed == screens
          ? _value.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as StackList<MobileScreen>?,
      argument: null == argument
          ? _value._argument
          : argument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  _$NavigationStateImpl(
      {this.root = RootPage.login,
      this.menu = MenuPage.books,
      this.screens,
      final Map<String, dynamic> argument = const {},
      this.id = ""})
      : _argument = argument;

  @override
  @JsonKey()
  final RootPage root;
  @override
  @JsonKey()
  final MenuPage menu;
  @override
  final StackList<MobileScreen>? screens;
  final Map<String, dynamic> _argument;
  @override
  @JsonKey()
  Map<String, dynamic> get argument {
    if (_argument is EqualUnmodifiableMapView) return _argument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_argument);
  }

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'NavigationState(root: $root, menu: $menu, screens: $screens, argument: $argument, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStateImpl &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.screens, screens) || other.screens == screens) &&
            const DeepCollectionEquality().equals(other._argument, _argument) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, root, menu, screens,
      const DeepCollectionEquality().hash(_argument), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      __$$NavigationStateImplCopyWithImpl<_$NavigationStateImpl>(
          this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  factory _NavigationState(
      {final RootPage root,
      final MenuPage menu,
      final StackList<MobileScreen>? screens,
      final Map<String, dynamic> argument,
      final String id}) = _$NavigationStateImpl;

  @override
  RootPage get root;
  @override
  MenuPage get menu;
  @override
  StackList<MobileScreen>? get screens;
  @override
  Map<String, dynamic> get argument;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
