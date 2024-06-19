// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeaturedItemImpl _$$FeaturedItemImplFromJson(Map<String, dynamic> json) =>
    _$FeaturedItemImpl(
      name: json['name'] as String? ?? '',
      model: json['model'] as String? ?? '',
      price: json['price'] as num? ?? 0.0,
      image: json['image'] as String? ?? '',
      modelColor: json['modelColor'] == null
          ? const Color(0xFFFFFFFF)
          : const ColorConverter().fromJson(json['modelColor'] as int),
    );

Map<String, dynamic> _$$FeaturedItemImplToJson(_$FeaturedItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'price': instance.price,
      'image': instance.image,
      'modelColor': const ColorConverter().toJson(instance.modelColor),
    };
