import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tutorial_app/product/core/model/base_model.dart';
import 'package:tutorial_app/product/core/model/response_model.dart';

import 'iservice_manager.dart';

/// Videolu anlatım için, https://www.youtube.com/watch?v=yB0JOOtq-iI&t=914s
/// [ServiceManager] sınıfı, en üst katmanda olan service sınıfıdır.
/// Bu sınıf service isteklerinin temelini oluşturur.
/// Tüm service istekleri buradan yapılır ve bu isteklerde dönüş tipi olarak,
/// [ResponseModel] tipinde bir dönüş yapılır.
/// Bu sınıf bağımsız bir yapı oluşturmak için arada bir katman görevi görmektedir.
/// Bu sınıfı kullanarak, tüm service isteklerini tek bir yerden yapabiliriz.
/// Service için kullanılan paketler burada import edilir ve kullanılır.
/// Bu sayede projenin geri kalanında bir değişiklik yapmadan,
/// sadece burada ki değişiklik ile service yöntemini değiştirebilirsiniz.
/// Örneğin, [http] paketi yerine [dio] yada [vexana] paketini kullanmak istediğinizde,
/// sadece bu sınıfı değiştirmeniz yeterli olacaktır.
final class ServiceManager extends IServiceManager {
  /// [ServiceManager] sınıfının yapıcı metodu.
  /// Bu metot, sınıfın nesnesi oluşturulduğunda çalışır.
  /// Bu metot içerisinde, [http.Client] sınıfından bir nesne oluşturulur.
  /// Bu nesne, API istekleri yapmak için kullanılır.
  /// Bu nesne, sınıfın dışında oluşturulduğu için, sınıfın dışından erişilemez.
  /// Bu nesne, sadece bu sınıf içerisinde kullanılır.
  ServiceManager(this._baseUrl) {
    _client = http.Client();
  }

  final String? _baseUrl;

  /// Bu değişken, API'nin base url'ini belirtir.

  /// Bu değişken, API isteklerinde kullanılacak header bilgilerini belirtir.
  final _headers = {
    'Content-Type': 'application/json',
  };

  /// Bu değişken, API isteklerinde kullanılacak http.Client sınıfından bir nesne oluşturur.
  /// [_client] değişkeni, sadece bu sınıf içerisinde kullanılır.
  /// late anahtar kelimesi, değişkenin değerinin daha sonra atanacağını belirtir.
  /// Bu değişkenin değeri, sınıfın yapıcı metodu içerisinde atanır.
  /// nullable olma durumu olmadığı için late anahtar kelimesi kullanılmıştır.
  late final http.Client _client;

  /// [get] metodu, API'den veri getirme işlemleri için kullanılır.
  /// [T] tipi model parametresi parse edilecek verinin tipini belirtir.
  /// [path] parametresi API endpoint'ini belirtir.
  /// [model] parametresi parse edilecek modeli belirtir.
  /// [model] parametresi null ise hata döner.
  /// [T] dönüş tipi BaseModel sınıfından türetilmiş bir sınıf olmalıdır.
  /// BaseModel Sınıfı içeriğinde, fromJson metodu bulunmalıdır.
  /// Bu metot, API'den gelen veriyi parse eder.
  @override
  Future<ResponseModel<T>> get<T extends BaseModel>(
    String path, {
    /// [T] tipi model parametresi parse edilecek verinin tipini belirtir.
    required T model,
  }) async {
    final http.Response response;

    /// Bu değişken, API'nin base url'ini kontrol eden bir extension metodu oluşturur.
    final checkUrl = _CheckUrl(_baseUrl ?? '');

    /// [checkUrl.urlIsCorrect] değişkeni, API'nin base url'ini kontrol eder.
    /// Eğer base url doğru değilse, hata döner.
    /// Bu durumda, API isteği yapılmaz ve geliştirme aşamasında hata alınmış olur.
    if (!checkUrl.urlIsCorrect) {
      throw Exception('URL is not correct');
    }
    try {
      /// API'den veri getirme işlemi yapılır.
      /// [path] parametresi API endpoint'ini belirtir.
      /// Bu işlem try-catch bloğu içerisinde yapılır.
      /// Eğer bir hata oluşursa, catch bloğu çalışır.
      /// Hata durumunda, HttpException sınıfı ile hatanın detayı alınır.
      /// Bu hata, ResponseModel sınıfı içerisinde döner.
      /// Eğer hata oluşmazsa, response döner.
      /// response dönerse, response.statusCode kontrol edilir.
      /// Eğer response.statusCode 200(HttpStatus.ok) değilse, hata döner.
      /// Eğer response.statusCode 200(HttpStatus.ok) ise, response.body parse edilir.
      /// Parse edilen veri, ResponseModel sınıfı içerisinde döner.
      /// Eğer model null ise, hata döner.
      response =
          await _client.get(Uri.parse('$_baseUrl$path'), headers: _headers);

      /// [response.statusCode] 200(HttpStatus.ok) değilse, hata döner.
      if (response.statusCode != HttpStatus.ok) {
        return ResponseModel(
            message: response.reasonPhrase, statusCode: response.statusCode);
      }
      final parsedModel = model.fromJson(response.body);
      return ResponseModel(data: parsedModel, statusCode: response.statusCode);
    } on HttpException catch (e) {
      return ResponseModel(message: e.message);
    }
  }
}

/// Bu extension metodu, API'nin base url'ini kontrol eder.
/// Eğer base url doğru değilse, hata döner.
/// Bu durumda, API isteği yapılmaz ve geliştirme aşamasında hata alınmış olur.
/// Bu extension metodu, ServiceManager sınıfı içerisinde kullanılır.
/// Bu extension metodu, ServiceManager sınıfı içerisinde private olarak tanımlanmıştır.
/// Bu extension metot istenilen bir biçimde düzenlenebilir ve yeni özellikler eklenebilir.

extension type const _CheckUrl(String url) {
  bool get urlIsCorrect => url.startsWith('http') || url.startsWith('https');
}
