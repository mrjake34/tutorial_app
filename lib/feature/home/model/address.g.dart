// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Address',
      json,
      ($checkedConvert) {
        final val = Address(
          street: $checkedConvert('street', (v) => v as String?),
          suite: $checkedConvert('suite', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          zipcode: $checkedConvert('zipcode', (v) => v as String?),
          geo: $checkedConvert(
              'geo',
              (v) =>
                  v == null ? null : Geo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo?.toJson(),
    };
