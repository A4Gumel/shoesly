

import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'featured_item_model.freezed.dart';
part 'featured_item_model.g.dart';

typedef FeaturedItemList = List<FeaturedItem>;

@freezed
class FeaturedItem with _$FeaturedItem {
  factory FeaturedItem({
    @Default('') String name,
    @Default('') String model,
    @Default(0.0) num price,
    @Default('') String image,
    @ColorConverter() @Default(Color(0xFFFFFFFF)) Color modelColor,
  }) = _FeaturedItem;

  factory FeaturedItem.fromJson(dynamic json) => _$FeaturedItemFromJson(json);
}


class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}
