import 'package:json_annotation/json_annotation.dart';

import '../../../product/core/model/base_model.dart';

part 'company.g.dart';

@JsonSerializable(
  checked: true,
  explicitToJson: true,
)
final class Company extends BaseModel<Company> {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  Company fromJson(json) => Company.fromJson(json);

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
