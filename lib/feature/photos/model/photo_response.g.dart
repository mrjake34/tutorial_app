// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) =>
    PhotoResponse(
      success: json['success'] as bool?,
      totalPhotos: json['totalPhotos'] as int?,
      message: json['message'] as String?,
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotoResponseToJson(PhotoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'totalPhotos': instance.totalPhotos,
      'message': instance.message,
      'offset': instance.offset,
      'limit': instance.limit,
      'photos': instance.photos,
    };
