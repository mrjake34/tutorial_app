import 'package:json_annotation/json_annotation.dart';

import '../../../product/core/model/base_model.dart';
part 'photos.g.dart';

@JsonSerializable()
final class Photos extends BaseModel<Photos> {
  final String? url;
  final String? title;
  final int? user;
  @JsonKey(name: '_id')
  final int? id;
  final String? description;

  const Photos({
    this.url,
    this.title,
    this.user,
    this.id,
    this.description,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhotosToJson(this);

  Photos copyWith({
    String? url,
    String? title,
    int? user,
    int? id,
    String? description,
  }) {
    return Photos(
      url: url ?? this.url,
      title: title ?? this.title,
      user: user ?? this.user,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Photos fromJson(json) => Photos.fromJson(json);

  @override
  List<Object?> get props => [url, title, user, id, description];
}
