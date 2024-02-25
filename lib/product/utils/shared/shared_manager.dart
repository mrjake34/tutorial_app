import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_app/product/core/enums/shared_manager_enums.dart';

/// [SharedManager] sınıfı, uygulama içerisinde kullanılacak olan shared_preferences paketini yönetir.
/// Bu sınıf, uygulama içerisinde kullanılacak olan verileri saklamak için kullanılır.
/// Paket bağımsızlığını sağlamak için, [SharedManagerEnums] sınıfı kullanılır.
/// Bu sınıf, shared_preferences paketini kullanırken, [SharedManagerEnums] olan key'leri içerir.
/// Bu sayede, shared_preferences paketinin kullanımı sırasında, key'lerin yanlış
/// kullanılmasının önüne geçilir.
final class SharedManager {
  /// Bu sınıfın dışarıdan erişilebilir olmaması için
  /// private bir constructor oluşturulur.
  /// Bu sayede bu sınıf kullanılarak yeni bir nesne oluşturulamaz.
  /// Uygulama içerisinde tek bir nesne oluşturulur ve bu nesne üzerinden
  /// methodlar çağrılır.
  SharedManager._();

  /// [SharedPreferences] sınıfından bir nesne oluşturulur fakat bu nesneye herhangi bir değer atanmaz.
  /// Bu nesne, _ private olarak tanımlanmıştır.
  /// Bu sayede, bu nesne sadece bu sınıf içerisinde kullanılabilir. Dışarıdan erişilemez.
  static late final SharedPreferences _sharedPreferences;

  /// [init] metodu, shared_preferences paketini başlatmak için kullanılır.
  /// Bu metot, uygulama başlatıldığında çalıştırılmalıdır.
  /// Bu metot, async olarak tanımlanmıştır. Bu metot içerisinde await kullanıldığı için async olarak tanımlanmıştır.
  /// Yani bu method Future olduğu için gelecekte çalışacağı belirtilir.
  /// async ve await anahtar kelimeleri, bu metot içerisinde başka bir metot çağrıldığında,
  /// bu metotun tamamlanmasını bekler.
  /// Bu sayede, bu metot içerisindeki işlemler sırasıyla yapılır.
  /// static olarak tanımlanmıştır. Bu sayede, bu metot, sınıfın dışından erişilebilir.
  /// Örnek kullanım:
  /// await SharedManager.init();
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// [setString] metodu, shared_preferences paketinde string veri saklamak için kullanılır.
  /// [key] parametresi, saklanacak verinin key'ini belirtir.
  /// [value] parametresi, saklanacak veriyi belirtir.
  /// bu metot, Future<bool> tipinde bir değer döner.
  /// işlem başarılı ise true, başarısız ise false döner.
  static Future<bool> setString(SharedManagerEnums? key, String? value) async {
    /// Eğer [key] veya [value] null ise, false döner.
    if (key == null || value == null) return false;

    /// shared_preferences paketinin setString metodu kullanılarak, veri saklanır.
    /// [key.name] ile key belirtilir.
    /// [value] ile saklanacak veri belirtilir.
    /// eğer işlem başarılı ise true, başarısız ise false döner.
    return await _sharedPreferences.setString(key.name, value);
  }

  /// [getString] metodu, shared_preferences paketinden string veri getirmek için kullanılır.
  /// [key] parametresi, getirilecek verinin key'ini belirtir.
  /// bu metot, String? tipinde bir değer döner.
  /// eğer veri bulunamaz ise null döner.
  static String? getString(SharedManagerEnums? key) {
    if (key == null) return null;
    return _sharedPreferences.getString(key.name);
  }

  /// [setBool] metodu, shared_preferences paketinde bool veri saklamak için kullanılır.
  /// [key] parametresi, saklanacak verinin key'ini belirtir.
  /// [value] parametresi, saklanacak veriyi belirtir.
  /// bu metot, Future<bool> tipinde bir değer döner.
  /// işlem başarılı ise true, başarısız ise false döner.
  static Future<bool> setBool(SharedManagerEnums? key, bool? value) async {
    if (key == null || value == null) return false;
    return await _sharedPreferences.setBool(key.name, value);
  }

  /// [getBool] metodu, shared_preferences paketinden bool veri getirmek için kullanılır.
  static bool? getBool(SharedManagerEnums? key) {
    if (key == null) return null;
    return _sharedPreferences.getBool(key.name);
  }

  /// [setInt] metodu, shared_preferences paketinde int veri saklamak için kullanılır.
  static Future<bool> setInt(SharedManagerEnums? key, int? value) async {
    if (key == null || value == null) return false;
    return await _sharedPreferences.setInt(key.name, value);
  }

  /// [getInt] metodu, shared_preferences paketinden int veri getirmek için kullanılır.
  static int? getInt(SharedManagerEnums? key) {
    if (key == null) return null;
    return _sharedPreferences.getInt(key.name);
  }

  /// [setDouble] metodu, shared_preferences paketinde double veri saklamak için kullanılır.
  static Future<bool> setDouble(SharedManagerEnums? key, double? value) async {
    if (key == null || value == null) return false;
    return await _sharedPreferences.setDouble(key.name, value);
  }

  /// [getDouble] metodu, shared_preferences paketinden double veri getirmek için kullanılır.
  static double? getDouble(SharedManagerEnums? key) {
    if (key == null) return null;
    return _sharedPreferences.getDouble(key.name);
  }

  /// [remove] metodu, shared_preferences paketinden veri silmek için kullanılır.
  /// [key] parametresi, silinecek verinin key'ini belirtir.
  /// bu metot, Future<bool> tipinde bir değer döner.
  /// işlem başarılı ise true, başarısız ise false döner.
  /// [key] null ise, false döner.
  /// bu metot bir key'e ait veriyi siler.
  static Future<bool> remove(SharedManagerEnums? key) async {
    if (key == null) return false;
    return await _sharedPreferences.remove(key.name);
  }

  /// [clear] metodu, shared_preferences paketindeki tüm verileri silmek için kullanılır.
  /// bu metot, Future<bool> tipinde bir değer döner.
  /// işlem başarılı ise true, başarısız ise false döner.
  /// Bu metot, tüm verileri siler. Bu metot, uygulama içerisinde kullanıcı çıkışı
  /// durumunda kullanılabilir.
  static Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
