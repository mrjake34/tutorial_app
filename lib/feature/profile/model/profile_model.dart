import 'package:json_annotation/json_annotation.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
final class ProfileModel extends BaseModel {
  final String? fullName;
  final String? email;
  final String? phoneNumber;

  const ProfileModel({this.fullName, this.email, this.phoneNumber});

  @override
  ProfileModel fromJson(json) => _$ProfileModelFromJson(json);

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
      ];

  @override
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
