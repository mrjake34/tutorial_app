// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Geo',
      json,
      ($checkedConvert) {
        final val = Geo(
          lat: $checkedConvert('lat', (v) => v as String?),
          lng: $checkedConvert('lng', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
