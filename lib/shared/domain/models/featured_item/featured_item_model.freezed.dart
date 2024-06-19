// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'featured_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeaturedItem _$FeaturedItemFromJson(Map<String, dynamic> json) {
  return _FeaturedItem.fromJson(json);
}

/// @nodoc
mixin _$FeaturedItem {
  String get name => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get modelColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturedItemCopyWith<FeaturedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedItemCopyWith<$Res> {
  factory $FeaturedItemCopyWith(
          FeaturedItem value, $Res Function(FeaturedItem) then) =
      _$FeaturedItemCopyWithImpl<$Res, FeaturedItem>;
  @useResult
  $Res call(
      {String name,
      String model,
      num price,
      String image,
      @ColorConverter() Color modelColor});
}

/// @nodoc
class _$FeaturedItemCopyWithImpl<$Res, $Val extends FeaturedItem>
    implements $FeaturedItemCopyWith<$Res> {
  _$FeaturedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? price = null,
    Object? image = null,
    Object? modelColor = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      modelColor: null == modelColor
          ? _value.modelColor
          : modelColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturedItemImplCopyWith<$Res>
    implements $FeaturedItemCopyWith<$Res> {
  factory _$$FeaturedItemImplCopyWith(
          _$FeaturedItemImpl value, $Res Function(_$FeaturedItemImpl) then) =
      __$$FeaturedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String model,
      num price,
      String image,
      @ColorConverter() Color modelColor});
}

/// @nodoc
class __$$FeaturedItemImplCopyWithImpl<$Res>
    extends _$FeaturedItemCopyWithImpl<$Res, _$FeaturedItemImpl>
    implements _$$FeaturedItemImplCopyWith<$Res> {
  __$$FeaturedItemImplCopyWithImpl(
      _$FeaturedItemImpl _value, $Res Function(_$FeaturedItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? price = null,
    Object? image = null,
    Object? modelColor = null,
  }) {
    return _then(_$FeaturedItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      modelColor: null == modelColor
          ? _value.modelColor
          : modelColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturedItemImpl implements _FeaturedItem {
  _$FeaturedItemImpl(
      {this.name = '',
      this.model = '',
      this.price = 0.0,
      this.image = '',
      @ColorConverter() this.modelColor = const Color(0xFFFFFFFF)});

  factory _$FeaturedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturedItemImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String model;
  @override
  @JsonKey()
  final num price;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  @ColorConverter()
  final Color modelColor;

  @override
  String toString() {
    return 'FeaturedItem(name: $name, model: $model, price: $price, image: $image, modelColor: $modelColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturedItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.modelColor, modelColor) ||
                other.modelColor == modelColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, model, price, image, modelColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturedItemImplCopyWith<_$FeaturedItemImpl> get copyWith =>
      __$$FeaturedItemImplCopyWithImpl<_$FeaturedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturedItemImplToJson(
      this,
    );
  }
}

abstract class _FeaturedItem implements FeaturedItem {
  factory _FeaturedItem(
      {final String name,
      final String model,
      final num price,
      final String image,
      @ColorConverter() final Color modelColor}) = _$FeaturedItemImpl;

  factory _FeaturedItem.fromJson(Map<String, dynamic> json) =
      _$FeaturedItemImpl.fromJson;

  @override
  String get name;
  @override
  String get model;
  @override
  num get price;
  @override
  String get image;
  @override
  @ColorConverter()
  Color get modelColor;
  @override
  @JsonKey(ignore: true)
  _$$FeaturedItemImplCopyWith<_$FeaturedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
