import 'dart:convert';
import 'package:tutorial_app/feature/photos/model/photo_response.dart';
import 'package:tutorial_app/feature/photos/model/photos.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

final class PhotosResponseModel extends BaseModel<PhotosResponseModel> {
  final PhotoResponse? data;
  final Photos? photo;
  final String? error;
  final int? statusCode;
  const PhotosResponseModel({
    this.data,
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
        data: PhotoResponse.fromJson(decodedData as Map<String, dynamic>),
      );
    } else if (decodedData is List) {
      return PhotosResponseModel(
        data: PhotoResponse.fromJson({'photos': decodedData}),
      );
    } else {
      return const PhotosResponseModel(
        error: 'Json decode error',
      );
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = this.data?.toJson();
    return {
      'photos': data,
    };
  }

  @override
  List<Object?> get props => [data, photo, error, statusCode];
}
