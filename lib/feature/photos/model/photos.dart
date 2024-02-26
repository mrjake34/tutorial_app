import 'package:json_annotation/json_annotation.dart';
part 'photos.g.dart';

@JsonSerializable()
class Photos {
  String? url;
  String? title;
  int? user;
  int? id;
  String? description;

  Photos({
    this.url,
    this.title,
    this.user,
    this.id,
    this.description,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

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
}
