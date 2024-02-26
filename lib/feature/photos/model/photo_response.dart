import 'package:json_annotation/json_annotation.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';
import 'photos.dart';
part 'photo_response.g.dart';

@JsonSerializable()
final class PhotoResponse extends BaseModel<PhotoResponse> {
  final bool? success;
  final int? totalPhotos;
  final String? message;
  final int? offset;
  final int? limit;
  final List<Photos>? photos;

  const PhotoResponse({
    this.success,
    this.totalPhotos,
    this.message,
    this.offset,
    this.limit,
    this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseFromJson(json);

  @override
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

  @override
  PhotoResponse fromJson(json) => PhotoResponse.fromJson(json);

  @override
  List<Object?> get props => [
        success,
        totalPhotos,
        message,
        offset,
        limit,
        photos,
      ];
}
