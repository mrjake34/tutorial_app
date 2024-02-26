// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      url: json['url'] as String?,
      title: json['title'] as String?,
      user: json['user'] as int?,
      id: json['id'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'user': instance.user,
      'id': instance.id,
      'description': instance.description,
    };
