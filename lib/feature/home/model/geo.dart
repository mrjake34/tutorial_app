import 'package:json_annotation/json_annotation.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

part 'geo.g.dart';

@JsonSerializable(
  checked: true,
  explicitToJson: true,
)
final class Geo extends BaseModel<Geo> {
  final String? lat;
  final String? lng;

  const Geo({
    this.lat,
    this.lng,
  });

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$GeoToJson(this);

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  @override
  Geo fromJson(json) => Geo.fromJson(json);

  @override
  List<Object?> get props => [lat, lng];
}
