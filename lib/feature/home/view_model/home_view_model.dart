import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/model/user_model.dart';
import 'package:tutorial_app/product/core/enums/shared_manager_enums.dart';
import '../../../product/utils/shared/shared_manager.dart';
import '../service/home_service.dart';

/// [ChangeNotifier] sınıfından bir nesne oluşturulur.
/// Bu sınıf ile [HomeService] sınıfından gelen veriler işlenir.
/// [ChangeNotifier] sınıfı ile [Provider] paketi kullanılarak state management yapılır.
/// [ChangeNotifier] sınıfı, [notifyListeners] metodu ile dinleyen widget'ları günceller.
/// [notifyListeners] metodu, [ChangeNotifier] sınıfının içerisindeki değişkenlerde
/// değişiklik olduğunda çalıştırılır.
final class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._homeService);

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
  List<UserModel>? _users;
  UserModel? _user;
  int? _statusCode;
  String? _error;
  bool _savedData = false;

  /// [HomeViewModel] sınıfına ait değişkenlere erişmek için get metotları kullanılır.
  /// Bu metotlar dışarıdan erişim sağlar.
  /// get metotları sadece getter işlemi yapar, değişkenlere değer ataması yapmaz.
  List<UserModel>? get users => _users;
  UserModel? get user => _user;
  int? get statusCode => _statusCode;
  String? get error => _error;
  bool get isSavedData => _savedData;

  /// [HomeService] sınıfından bir nesne oluşturulur.
  /// Bu sınıf ile [ServiceManager] dan gelen veriler işlenir.
  late final HomeService _homeService;

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
    if (hasListeners) {
      notifyListeners();
    }
  }

  void setUser(int id) async {
    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    final response = await _homeService.getUser(id);
    _user = response.user;
    _statusCode = response.statusCode;
    _error = response.error;
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// [saveUser] metodu, [SharedManager] sınıfı kullanılarak kullanıcı bilgilerini saklar.
  /// [User] tipinde bir parametre alır.
  /// Bu metot, [SharedManager] sınıfının [setSavedData] metodu kullanılarak
  void saveUser(UserModel user) async {
    final isSavedData = await SharedManager.setSavedData<UserModel>(
        SharedManagerEnums.savedUser, user);
    _savedData = isSavedData;
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// [getSavedUser] metodu, [SharedManager] sınıfı kullanılarak saklanan kullanıcı bilgilerini getirir.
  /// Bu metot, [SharedManager] sınıfının [getSavedData] metodu kullanılarak
  /// saklanan kullanıcı bilgilerini getirir.
  void getSavedUser() async {
    final user = SharedManager.getSavedData<UserModel>(
        SharedManagerEnums.savedUser, const UserModel());
    _user = user;
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// [removeSavedUser] metodu, [SharedManager] sınıfı kullanılarak saklanan kullanıcı bilgilerini siler.
  /// Bu metot, [SharedManager] sınıfının [remove] metodu kullanılarak
  /// saklanan kullanıcı bilgilerini siler.
  void removeSavedUser() async {
    final isRemoved = await SharedManager.remove(SharedManagerEnums.savedUser);
    _savedData = !isRemoved;
    if (hasListeners) {
      notifyListeners();
    }
  }
}
