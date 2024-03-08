import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/feature/home/model/user_model.dart';
import 'package:tutorial_app/feature/home/service/home_service.dart';
import 'package:tutorial_app/feature/photos/model/photos.dart';
import 'package:tutorial_app/feature/photos/service/photos_service.dart';

void main() {
  /// [HomeService] sınıfından bir nesne oluşturulur.
  /// Bu nesne, testlerde kullanılmak üzere oluşturulur.
  /// late eklenerek bu nesnenin ileride tanımlanacağı belirtilir.
  late final HomeService homeService;
  late final PhotosService photosService;

  /// Testler çalışmadan önce çalıştırılacak kod bloğu.
  /// Bu blok içerisinde, testlerde kullanılacak olan nesneler oluşturulur.
  setUp(() {
    /// [homeService] değişkenine [HomeService] sınıfı atanır.
    homeService = HomeService();
    photosService = PhotosService();
  });

  test('Home Service', () async {
    /// [HomeService] sınıfının [getUsers] metodu çağrılır.
    final response = await homeService.getUsers();

    /// Eğer [response.statusCode] 200 ise, [response.users] null değilse
    /// ve [response.users] içerisinde [User] sınıfından nesneler varsa
    /// test başarılıdır.
    expect(response.statusCode, HttpStatus.ok);
    expect(response.users, isNotNull);
    expect(response.users?.cast<UserModel>(), isNotEmpty);
  });
  test('Photo Service', () async {
    /// [HomeService] sınıfının [getUsers] metodu çağrılır.
    final response = await photosService.getPhotos(0, 10);

    /// Eğer [response.statusCode] 200 ise, [response.users] null değilse
    /// ve [response.users] içerisinde [User] sınıfından nesneler varsa
    /// test başarılıdır.
    expect(response.statusCode, HttpStatus.ok);
    expect(response.photos?.photos, isNotNull);
    expect(response.photos?.photos?.cast<Photos>(), isNotEmpty);
  });
}
