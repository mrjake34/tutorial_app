import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_app/feature/auth/login/model/login_request_model.dart';
import 'package:tutorial_app/product/utils/cache/preference_key.dart';

part 'mixin/cache_models_mixin.dart';
part 'mixin/cache_auth_mixin.dart';
part 'mixin/cache_repository_mixin.dart';

final class CacheManager
    with CacheModelsMixin, CacheAuthMixin, CacheRepositoryMixin {
  CacheManager._();

  /// [_instance] değişkeni [CacheManager] sınıfının nesnesini tutar.
  static final _instance = CacheManager._();

  /// [_isInitialized] değişkeni [CacheManager] sınıfının
  /// [init] metodu çağrıldıktan sonra true olur.
  static bool _isInitialized = false;

  /// [instance] metodu [CacheManager] sınıfının nesnesini döndürür.
  /// Eğer [init] metodu çağrılmamışsa [_isInitialized] değişkeni false olur.
  /// Bu durumda hata alınır.
  ///
  /// Eğer [init] metodu çağrılmışsa [_isInitialized] değişkeni true olur.
  ///
  /// Bu metodu çağırmadan önce [init] metodunun çağrıldığından emin olunmalıdır
  static CacheManager get instance {
    assert(_isInitialized, 'CacheManager is not initialized');
    return _instance;
  }

  static late final SharedPreferences _preference;

  /// [init] metodu [SharedPreferences] nesnesini oluşturur.
  /// ve [_preference] değişkenine atar.
  ///
  /// Bu metot çağrılmadan diğer metotlar kullanılamaz.
  ///
  /// Bu metot main metodu yada [AppStarter.startApp()]
  /// içerisinde çağrılmalıdır.
  /// Örneğin;
  /// ```dart
  /// Future<void> main() async {
  ///  await CacheManager.init();
  /// runApp(MyApp());
  /// }
  /// ```
  ///
  /// Bu metot çağrıldıktan sonra diğer metotlar kullanılabilir.
  /// [_isInitialized] değişkeni true yapılır.
  /// Bu değişken [instance] metodu içerisinde kontrol edilir.
  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  /// [setDataList] metodu [List<String>] tipinde bir veri alır ve
  /// [PreferenceKey] tipinde bir anahtar alır.
  /// Bu anahtara karşılık gelen veriyi kaydeder.
  ///
  /// Veri kaydedilirse true döner.
  /// Veri kaydedilemezse false döner.
  ///
  /// Veri kaydedilirken veri tipi belirtilmez.
  /// Sadece [List<String>] tipinde veri kaydedilebilir.
  Future<bool> setDataList(List<String> dataList, PreferenceKey key) async {
    return _preference.setStringList(key.name, dataList);
  }

  /// [getDataList] metodu [PreferenceKey] tipinde bir anahtar alır ve
  /// bu anahtara karşılık gelen veriyi döndürür.
  /// Veri yoksa null döner.
  /// Veri varsa [List<String>] tipinde veri döner.
  List<String>? getDataList(PreferenceKey key) {
    return _preference.getStringList(key.name);
  }

  /// [setData] metodu ile veri kaydedilirken veri tipi belirtilmelidir.
  ///
  /// Örneğin; [setData<int>(5, PreferenceKey.someKey)] şeklinde kullanılmalıdır
  ///
  /// Veri tipi belirtilmezse hata alınır.
  ///
  /// Veri tipi belirtilen veri tipinde kaydedilemiyorsa false döner.
  /// Veri tipi belirtilen veri tipinde kaydediliyorsa true döner.
  Future<bool> setData<T>(T data, PreferenceKey key) {
    assert(T == double || T == int || T == bool || T == String, 'Invalid type');
    return switch (T) {
      const (double) => _preference.setDouble(key.name, data as double),
      const (int) => _preference.setInt(key.name, data as int),
      const (bool) => _preference.setBool(key.name, data as bool),
      const (String) => _preference.setString(key.name, data.toString()),
      _ => Future.value(false),
    };
  }

  /// [getData] metodu ile veri çekilirken veri tipi belirtilmelidir.
  ///
  /// Örneğin; [getData<int>(PreferenceKey.someKey)] şeklinde kullanılmalıdır.
  ///
  /// Veri tipi belirtilmezse hata alınır.
  /// Veri tipi belirtilen veri tipine dönüştürülemezse null döner.
  T? getData<T>(PreferenceKey key) {
    assert(T == double || T == int || T == bool || T == String, 'Invalid type');
    return switch (T) {
      const (double) => _preference.getDouble(key.name) as T?,
      const (int) => _preference.getInt(key.name) as T?,
      const (bool) => _preference.getBool(key.name) as T?,
      const (String) => _preference.getString(key.name) as T?,
      _ => null,
    };
  }

  /// [clearData] metodu [PreferenceKey] tipinde bir anahtar alır ve
  /// bu anahtara karşılık gelen veriyi siler.
  ///
  /// Veri silinirse true döner.
  /// Veri silinemezse false döner.
  Future<bool> clearData(PreferenceKey key) async {
    return _preference.remove(key.name);
  }

  /// [deleteAll] metodu tüm verileri siler.
  ///
  /// Tüm veriler silinirse true döner.
  /// Tüm veriler silinemezse false döner.
  Future<bool> deleteAll() async {
    return _preference.clear();
  }
}
