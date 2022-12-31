// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataResponse _$ImageDataResponseFromJson(Map<String, dynamic> json) =>
    ImageDataResponse(
      json['created'] as num?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ImageUrlResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageDataResponseToJson(ImageDataResponse instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data,
    };

ImageUrlResponse _$ImageUrlResponseFromJson(Map<String, dynamic> json) =>
    ImageUrlResponse(
      json['url'] as String?,
    );

Map<String, dynamic> _$ImageUrlResponseToJson(ImageUrlResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
