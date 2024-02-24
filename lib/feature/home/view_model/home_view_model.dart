import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/model/user.dart';
import '../service/home_service.dart';

/// [ChangeNotifier] sınıfından bir nesne oluşturulur.
/// Bu sınıf ile [HomeService] sınıfından gelen veriler işlenir.
/// [ChangeNotifier] sınıfı ile [Provider] paketi kullanılarak state management yapılır.
/// [ChangeNotifier] sınıfı, [notifyListeners] metodu ile dinleyen widget'ları günceller.
/// [notifyListeners] metodu, [ChangeNotifier] sınıfının içerisindeki değişkenlerde
/// değişiklik olduğunda çalıştırılır.
final class HomeViewModel extends ChangeNotifier {
  /// [HomeViewModel] sınıfının değişkenleri private olarak tanımlanmıştır.
  /// Bu değişkenleri dışarıdan doğrudan erişim olmaması içindir.
  /// Bu değişkenlere dışarıdan erişim yapmak için get metotları kullanılır.
  /// Bu değişkenlerin dışarıdan erişim olmaması, sınıfın dışarıdan erişilebilirliğini azaltır.
  /// Bu değişkenler sadefe fonksiyonlar içerisinde kullanılır.
  /// ve sadece o şekilde güncellenir.
  /// Dışarıdan güncellenmesi için set metotları kullanılır.
  // set users(List<User>? value) {
  //   _users = value;
  //   notifyListeners();
  // }
  List<User>? _users;
  User? _user;
  int? _statusCode;
  String? _error;

  /// [HomeViewModel] sınıfına ait değişkenlere erişmek için get metotları kullanılır.
  /// Bu metotlar dışarıdan erişim sağlar.
  /// get metotları sadece getter işlemi yapar, değişkenlere değer ataması yapmaz.
  List<User>? get users => _users;
  User? get user => _user;
  int? get statusCode => _statusCode;
  String? get error => _error;

  /// [HomeService] sınıfından bir nesne oluşturulur.
  /// Bu sınıf ile [ServiceManager] dan gelen veriler işlenir.
  final _homeService = HomeService();

  Future<void> setUsers() async {
    /// Kullanıcı listesi getirilir.
    final response = await _homeService.getUsers();

    /// [response.users] kullanıcı listesi _users değişkenine atanır.
    _users = response.users;

    /// [response.statusCode] durum kodu _statusCode değişkenine atanır.
    _statusCode = response.statusCode;

    /// [response.error] hata mesajı _error değişkenine atanır.
    _error = response.error;

    /// [notifyListeners] metodu ile dinleyen widget'ları günceller.
    notifyListeners();
  }

  Future<void> setUser(int id) async {
    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    final response = await _homeService.getUser(id);
    _user = response.user;
    _statusCode = response.statusCode;
    _error = response.error;
    notifyListeners();
  }
}
