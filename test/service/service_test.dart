import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/feature/home/model/user.dart';
import 'package:tutorial_app/feature/home/service/home_service.dart';

void main() {
  /// [HomeService] sınıfından bir nesne oluşturulur.
  /// Bu nesne, testlerde kullanılmak üzere oluşturulur.
  /// late eklenerek bu nesnenin ileride tanımlanacağı belirtilir.
  late final HomeService homeService;

  /// Testler çalışmadan önce çalıştırılacak kod bloğu.
  /// Bu blok içerisinde, testlerde kullanılacak olan nesneler oluşturulur.
  setUp(() {
    /// [homeService] değişkenine [HomeService] sınıfı atanır.
    homeService = HomeService();
  });

  test('Home Service', () async {
    /// [HomeService] sınıfının [getUsers] metodu çağrılır.
    final response = await homeService.getUsers();

    /// Eğer [response.statusCode] 200 ise, [response.users] null değilse
    /// ve [response.users] içerisinde [User] sınıfından nesneler varsa
    /// test başarılıdır.
    expect(response.statusCode, HttpStatus.ok);
    expect(response.users, isNotNull);
    expect(response.users!.cast<User>(), isNotEmpty);
  });
}
