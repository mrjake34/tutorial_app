import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/product/utils/localization/localization_manager.dart';
import 'package:tutorial_app/product/utils/remote_config/remote_config_manager.dart';

import '../../../firebase_options.dart';
import '../../utils/shared/shared_manager.dart';

/// [Starter] sınıfı, uygulama başlatıldığında çalıştırılması gereken işlemleri yönetir.
final class Starter {
  /// [Starter] sınıfının yapıcı metodu.
  /// bu sınıfın yapıcı metodu private olarak tanımlanmıştır.
  /// bu sınıftan nesne oluşturulmasını engeller.
  Starter._();

  /// [init] metodu, uygulama başlatıldığında çalıştırılması gereken metoddur.
  /// bu metot, uygulamanın içerisinde kullanılacak olan özelliklerin başlatılmasını sağlar.
  /// Burada ki işlemler sırasıyla yapılmalıdır, bu yüzden bu metot [async] olarak tanımlanmıştır.
  /// [await] ile beklenmesi gereken işlemler belirtilir.
  static Future<void> init() async {
    /// [WidgetsFlutterBinding.ensureInitialized] metodu, uygulamanın başlatılmasını sağlar.
    /// Bu metot, uygulamanın başlatılmasını sağlamak için kullanılır.
    /// Bu metot, uygulama başlatılmadan önce çalıştırılmalıdır.
    WidgetsFlutterBinding.ensureInitialized();

    /// Firebase servislerinin başlatılması için [Firebase.initializeApp] metodu çalıştırılır.
    /// FirebaseCore paketinin [initializeApp] metodu, Firebase servislerini başlatır.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    await RemoteConfigManager.init();
    await RemoteConfigManager.fetchAndActivate();

    /// [LocalizationManager] sınıfının [init] metodu çalıştırılır.
    await LocalizationManager.init();

    /// [SharedManager] sınıfının [init] metodu çalıştırılır.
    await SharedManager.init();
  }
}
