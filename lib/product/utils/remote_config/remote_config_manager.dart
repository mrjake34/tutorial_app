import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';

/// [RemoteConfigManager] sınıfı Firebase Remote Config servisini kullanarak
/// uygulama içerisindeki remote config verilerine erişim sağlar.
/// Bu sınıf ile gizli bilgilerin uygulama içerisinde tutulmadan kullanılmasını
/// yada uygulama içerisindeki sabit verilerin dinamik olarak değiştirilmesi sağlanır.
final class RemoteConfigManager {
  /// [remoteConfig] değişkeni Firebase Remote Config servisini kullanmak için
  /// oluşturulmuş bir değişkendir.
  /// Bu değişken üzerinden remote config verilerine erişim sağlanır.
  static final remoteConfig = FirebaseRemoteConfig.instance;

  /// [init] metodu ile remote config servisi başlatılır.
  /// Bu metodun çağrılması ile remote config servisi kullanıma hazır hale gelir.
  /// Bu metodun çağrılması uygulama başlatıldığında yapılmalıdır.
  static Future<void> init() async {
    /// Remote Config ayarları yapılır.
    /// Bu ayarlar ile remote config servisi ne kadar sürede bir veri çekeceği
    /// ve minimum ne kadar sürede bir veri çekileceği belirlenir.
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
  }

  /// [fetchAndActivate] metodu ile remote config servisinden veri çekilir ve
  /// bu veri kullanıma hazır hale getirilir.
  static Future<void> fetchAndActivate() async {
    await remoteConfig.fetchAndActivate();
  }

  /// [getString] metodu ile remote config servisinden string tipinde veri çekilir.
  static String getString(String key) {
    final reponse = remoteConfig.getString(key);
    return reponse;
  }

  /// [getBool] metodu ile remote config servisinden bool tipinde veri çekilir.
  static bool getBool(String key) {
    final reponse = remoteConfig.getBool(key);
    return reponse;
  }

  /// [setDefaults] metodu ile remote config servisi için varsayılan değerler
  /// belirlenir.
  Future<void> setDefaults(Map<String, dynamic> defaults) async {
    await remoteConfig.setDefaults(defaults);
  }

  /// [onConfigChanged] metodu ile remote config servisindeki verilerin değişip
  /// değişmediği dinlenir.
  /// Bu metodu StreamBuilder ile kullanabilirsiniz
  /// örnek:
  /// ```
  /// StreamBuilder<RemoteConfigUpdate>(
  ///        stream: RemoteConfigManager.onConfigChanged,
  ///       builder: (context, snapshot) {
  ///        return Container();
  ///      },
  ///   );
  /// ```
  static Stream<RemoteConfigUpdate> get onConfigChanged =>
      remoteConfig.onConfigUpdated;
}
