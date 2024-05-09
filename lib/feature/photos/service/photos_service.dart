import 'dart:io';

import 'package:tutorial_app/feature/photos/model/photos_response_model.dart';

import '../../../product/core/service/iservice_manager.dart';
import '../../../product/core/service/service_manager.dart';

final class PhotosService {
  PhotosService(this._service);

  /// [ServiceManager] sınıfından bir nesne oluşturulur.
  /// Bu sınıf ile API istekleri yapılır.
  /// parametre private olduğu için alt tire ile başlar.
  /// _service değişkenine dışarıdan erişim olmaması için private olarak tanımlanmıştır.
  /// Bu değişkenin dışarıdan erişim olmaması, sınıfın dışarıdan erişilebilirliğini azaltır.
  /// final değişken olduğu için sadece bir kere değer atanabilir.
  late final IServiceManager _service;

  Future<PhotosResponseModel> getPhotos(int start, int end) async {
    /// Kullanıcı listesi getirilir.
    /// [users] endpoint'i ile kullanıcı listesi getirilir.
    /// [model] parametresi parse edilecek modeli belirtir.
    /// [UsersResponseModel] dönüş tipi belirtilir.
    final response = await _service.get<PhotosResponseModel>(
      'photos?offset=$start&limit=$end',
      model: const PhotosResponseModel(),
    );

    /// [response.statusCode] 200(HttpStatus.ok) değilse, hata döner.
    if (response.statusCode != HttpStatus.ok) {
      return PhotosResponseModel(
        error: response.message,
        statusCode: response.statusCode,
      );
    }

    /// [response.statusCode] 200(HttpStatus.ok) ise, kullanıcı listesi döner.
    return PhotosResponseModel(
      photos: response.data?.photos,
      statusCode: response.statusCode,
    );
  }

  Future<PhotosResponseModel> getPhoto(int? id) async {
    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    /// [id] parametresi null ise hata döner.
    if (id == null) {
      return const PhotosResponseModel(
        error: 'Id is null',
        statusCode: HttpStatus.badRequest,
      );
    }

    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    final response = await _service.get<PhotosResponseModel>('photos/$id',
        model: const PhotosResponseModel());
    if (response.statusCode != HttpStatus.ok) {
      return PhotosResponseModel(
        error: response.message,
        statusCode: response.statusCode,
      );
    }
    return PhotosResponseModel(
      photos: response.data?.photos,
      statusCode: response.statusCode,
    );
  }
}
