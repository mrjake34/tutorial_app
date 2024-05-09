import 'dart:io';

import 'package:tutorial_app/feature/home/model/user_response_model.dart';

import '../../../product/core/service/iservice_manager.dart';
import '../../../product/core/service/service_manager.dart';

final class HomeService {
  HomeService(IServiceManager service) : _service = service;

  /// [ServiceManager] sınıfından bir nesne oluşturulur.
  /// Bu sınıf ile API istekleri yapılır.
  /// parametre private olduğu için alt tire ile başlar.
  /// _service değişkenine dışarıdan erişim olmaması için private olarak tanımlanmıştır.
  /// Bu değişkenin dışarıdan erişim olmaması, sınıfın dışarıdan erişilebilirliğini azaltır.
  /// final değişken olduğu için sadece bir kere değer atanabilir.
  late final IServiceManager _service;

  Future<UsersResponseModel> getUsers() async {
    /// Kullanıcı listesi getirilir.
    /// [users] endpoint'i ile kullanıcı listesi getirilir.
    /// [model] parametresi parse edilecek modeli belirtir.
    /// [UsersResponseModel] dönüş tipi belirtilir.
    final response = await _service.get<UsersResponseModel>(
      'users',
      model: const UsersResponseModel(),
    );

    /// [response.statusCode] 200(HttpStatus.ok) değilse, hata döner.
    if (response.statusCode != HttpStatus.ok) {
      return UsersResponseModel(
        error: response.message,
        statusCode: response.statusCode,
      );
    }

    /// [response.statusCode] 200(HttpStatus.ok) ise, kullanıcı listesi döner.
    return UsersResponseModel(
      users: response.data?.users,
      statusCode: response.statusCode,
    );
  }

  Future<UsersResponseModel> getUser(int? id) async {
    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    /// [id] parametresi null ise hata döner.
    if (id == null) {
      return const UsersResponseModel(
        error: 'Id is null',
        statusCode: HttpStatus.badRequest,
      );
    }

    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    final response = await _service.get<UsersResponseModel>(
      'users/$id',
      model: const UsersResponseModel(),
    );
    if (response.statusCode != HttpStatus.ok) {
      return UsersResponseModel(
        error: response.message,
        statusCode: response.statusCode,
      );
    }
    return UsersResponseModel(
      user: response.data?.user,
      statusCode: response.statusCode,
    );
  }
}
