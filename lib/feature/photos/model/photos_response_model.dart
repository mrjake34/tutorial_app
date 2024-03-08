import 'dart:convert';
import 'package:tutorial_app/feature/photos/model/photo_response.dart';
import 'package:tutorial_app/feature/photos/model/photos.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

final class PhotosResponseModel extends BaseModel<PhotosResponseModel> {
  final PhotoResponse? photos;
  final Photos? photo;
  final String? error;
  final int? statusCode;
  const PhotosResponseModel({
    this.photos,
    this.photo,
    this.error,
    this.statusCode,
  });

  @override
  fromJson(dynamic json) {
    /// [dynamic] gelen veri önce jsonDecode ile decode edilir.
    final decodedData = jsonDecode(json);

    /// [decodedData] Map ise
    /// [user] parametresine [User] sınıfından bir nesne oluşturulur ve atanır.
    if (decodedData is Map) {
      return PhotosResponseModel(
        photos: PhotoResponse.fromJson(decodedData as Map<String, dynamic>),
      );
    } else if (decodedData is List) {
      return PhotosResponseModel(
        photos: PhotoResponse.fromJson({'photos': decodedData}),
      );
    } else {
      return const PhotosResponseModel(
        error: 'Json decode error',
      );
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final photos = this.photos?.toJson();
    return {
      'photos': photos,
    };
  }

  @override
  List<Object?> get props => [photos, photo, error, statusCode];
}
