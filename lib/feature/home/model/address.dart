import 'package:json_annotation/json_annotation.dart';

import '../../../product/core/model/base_model.dart';
import 'geo.dart';

part 'address.g.dart';

@JsonSerializable(
  checked: true,
  explicitToJson: true,
)
final class Address extends BaseModel<Address> {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  const Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  int get hashCode => Object.hash(street, suite, city, zipcode, geo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;

  @override
  Address fromJson(json) => Address.fromJson(json);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
