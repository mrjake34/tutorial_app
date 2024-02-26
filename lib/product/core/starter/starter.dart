import 'package:flutter/material.dart';
import 'package:tutorial_app/product/utils/localization/localization_manager.dart';

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

    /// [LocalizationManager] sınıfının [init] metodu çalıştırılır.
    await LocalizationManager.init();

    /// [SharedManager] sınıfının [init] metodu çalıştırılır.
    await SharedManager.init();
  }
}
