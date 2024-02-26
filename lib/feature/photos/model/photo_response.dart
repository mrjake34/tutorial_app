import 'package:json_annotation/json_annotation.dart';
import 'photos.dart';
part 'photo_response.g.dart';

@JsonSerializable()
class PhotoResponse {
  bool? success;
  int? totalPhotos;
  String? message;
  int? offset;
  int? limit;
  List<Photos>? photos;

  PhotoResponse({
    this.success,
    this.totalPhotos,
    this.message,
    this.offset,
    this.limit,
    this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);

  PhotoResponse copyWith({
    bool? success,
    int? totalPhotos,
    String? message,
    int? offset,
    int? limit,
    List<Photos>? photos,
  }) {
    return PhotoResponse(
      success: success ?? this.success,
      totalPhotos: totalPhotos ?? this.totalPhotos,
      message: message ?? this.message,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      photos: photos ?? this.photos,
    );
  }
}
