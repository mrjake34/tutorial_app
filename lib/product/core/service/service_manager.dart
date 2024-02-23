import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tutorial_app/product/core/model/base_model.dart';
import 'package:tutorial_app/product/core/model/response_model.dart';

/// ServiceManager sınıfı, en üst katmanda olan service sınıfıdır.
/// Bu sınıf service isteklerinin temelini oluşturur.
/// Tüm service istekleri buradan yapılır ve bu isteklerde dönüş tipi olarak,
/// ResponseModel tipinde bir dönüş yapılır.
/// Bu sınıf bağımsız bir yapı oluşturmak için arada bir katman görevi görmektedir.
/// Bu sınıfı kullanarak, tüm service isteklerini tek bir yerden yapabiliriz.
/// Service için kullanılan paketler burada import edilir ve kullanılır.
/// Bu sayede projenin geri kalanında bir değişiklik yapmadan,
/// sadece burada ki değişiklik ile service yöntemini değiştirebilirsiniz.
/// Örneğin, http paketi yerine dio yada vexana paketini kullanmak istediğinizde,
/// sadece bu sınıfı değiştirmeniz yeterli olacaktır.
final class ServiceManager {
  ServiceManager() {
    _client = http.Client();
  }
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  final _headers = {
    'Content-Type': 'application/json',
  };
  late final http.Client _client;

  Future<ResponseModel<T>> get<T extends BaseModel>(String path,
      {T? model}) async {
    final http.Response response;
    try {
      response =
          await _client.get(Uri.parse('$_baseUrl$path'), headers: _headers);
      if (model == null) {
        return ResponseModel(message: 'Model is null', statusCode: 400);
      }
      final parsedModel = model.fromJson(response.body);
      return ResponseModel(data: parsedModel, statusCode: response.statusCode);
    } on HttpException catch (e) {
      return ResponseModel(message: e.message);
    }
  }
}
