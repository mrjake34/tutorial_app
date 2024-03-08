import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/photos/model/photo_response.dart';
import 'package:tutorial_app/feature/photos/model/photos.dart';
import 'package:tutorial_app/feature/photos/service/photos_service.dart';

/// [ChangeNotifier] sınıfından bir nesne oluşturulur.
/// Bu sınıf ile [PhotosService] sınıfından gelen veriler işlenir.
/// [ChangeNotifier] sınıfı ile [Provider] paketi kullanılarak state management yapılır.
/// [ChangeNotifier] sınıfı, [notifyListeners] metodu ile dinleyen widget'ları günceller.
/// [notifyListeners] metodu, [ChangeNotifier] sınıfının içerisindeki değişkenlerde
/// değişiklik olduğunda çalıştırılır.
final class PhotosViewModel extends ChangeNotifier {
  /// [PhotosViewModel] sınıfının değişkenleri private olarak tanımlanmıştır.
  /// Bu değişkenleri dışarıdan doğrudan erişim olmaması içindir.
  /// Bu değişkenlere dışarıdan erişim yapmak için get metotları kullanılır.
  /// Bu değişkenlerin dışarıdan erişim olmaması, sınıfın dışarıdan erişilebilirliğini azaltır.
  /// Bu değişkenler sadefe fonksiyonlar içerisinde kullanılır.
  /// ve sadece o şekilde güncellenir.
  /// Dışarıdan güncellenmesi için set metotları kullanılır.
  // set setPhoto(List<Photo>? value) {
  //   _photo = value;
  //   notifyListeners();
  // }
  PhotoResponse? _data;
  Photos? _photo;
  int? _statusCode;
  String? _error;

  /// [HomeViewModel] sınıfına ait değişkenlere erişmek için get metotları kullanılır.
  /// Bu metotlar dışarıdan erişim sağlar.
  /// get metotları sadece getter işlemi yapar, değişkenlere değer ataması yapmaz.
  PhotoResponse? get data => _data;
  Photos? get photo => _photo;
  int? get statusCode => _statusCode;
  String? get error => _error;

  /// [PhotoService] sınıfından bir nesne oluşturulur.
  /// Bu sınıf ile [ServiceManager] dan gelen veriler işlenir.
  final _photosService = PhotosService();

  Future<void> getPhotos(int start, int end) async {
    /// Kullanıcı listesi getirilir.
    final response = await _photosService.getPhotos(start, end);

    /// [response.photos] kullanıcı listesi [_photos] değişkenine atanır.
    _data = response.photos;

    /// [response.statusCode] durum kodu _statusCode değişkenine atanır.
    _statusCode = response.statusCode;

    /// [response.error] hata mesajı _error değişkenine atanır.
    _error = response.error;

    /// [notifyListeners] metodu ile dinleyen widget'ları günceller.
    /// [hasListeners] metodu ile dinleyen widget'lar var mı kontrol edilir.
    /// Eğer varsa [notifyListeners] metodu çalıştırılır.
    /// Bu sayede dinleyen widget'lar güncellenir.
    /// Dinleyen widget'lar güncellendikten sonra, [Consumer] sınıfı ile bu widget'lar yeniden oluşturulur.
    /// Dinleyen bir widget yoksa, [notifyListeners] metodu çalıştırılmaz.
    /// Bu sayede gereksiz yere widget'lar yeniden oluşturulmaz.
    /// Bu durumda performans artışı sağlanır.
    /// Ve dispose olmuş widget'lar gereksiz yere yeniden oluşturulmaz ve hata almaz.
    if (hasListeners) {
      notifyListeners();
    }
  }

  void getPhoto(int id) async {
    /// [id] parametresi ile kullanıcı bilgileri getirilir.
    final response = await _photosService.getPhoto(id);
    _photo = response.photo;
    _statusCode = response.statusCode;
    _error = response.error;
    if (hasListeners) {
      notifyListeners();
    }
  }
}
