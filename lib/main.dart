import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/product/core/constants/remote_config_keys.dart';
import 'package:tutorial_app/product/core/starter/starter.dart';
import 'package:tutorial_app/product/utils/localization/localization_manager.dart';
import 'package:tutorial_app/product/utils/remote_config/remote_config_manager.dart';
import 'package:tutorial_app/product/utils/router/router_manager.dart';

import 'product/utils/snackbar/custom_snackbar.dart';
import 'product/utils/theme/theme.dart';

/// Uygulamanın başlangıç noktası.
/// Uygulama başlatıldığında, bu sınıf çalışır.
/// Bu bölüm olabildiğince küçük tutulmalıdır.
/// Bu aşamada yapılan her işlem, uygulamanın başlatılmasını geciktirebilir.
Future<void> main() async {
  /// [Starter.init] metodu, uygulamanın başlatılması için gerekli olan temel konfigürasyonları yapar.
  /// Bu metot, uygulama başlatılmadan önce çalıştırılmalıdır.
  /// Uygulama başlatılmadan önce başlatılacak olan her şey bu metot içerisinde yapılır.
  /// Bu sayede burada ki kod karmaşasının önüne geçilir.
  /// Bu metot, Future olduğu için await anahtar kelimesi ile beklenir.
  await Starter.init();

  /// Uygulama hata yakalama işlemleri yapılır.
  /// Bu işlemler, uygulama içerisinde oluşan hataların yakalanmasını sağlar.
  /// Bu sayede uygulama içerisinde oluşan hatalar, Firebase Crashlytics üzerinden takip edilebilir.
  /// Bu işlemler, uygulama başlatılmadan önce yapılmalıdır.
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  /// Uygulama başlatılır.
  /// runApp metodu, uygulamanın başlatılmasını sağlar.
  /// runApp metodu içerisine, uygulamanın başlangıç widget'ı verilir.
  /// [LocalizationManager] widget'ı, uygulama içerisinde kullanılacak olan dil konfigürasyonlarını yapar.
  /// Bu işlem uygulama başlatılmadan önce yapılmalıdır.
  runApp(
    const LocalizationManagerStl(
      child: MyApp(),
    ),
  );
}

/// [MaterialApp] uygulamanın temel widget'ıdır.
/// Bu widget, uygulamanın temel konfigürasyonlarını yapar.
/// Uygulama içerisinde kullanılacak tema, başlangıç sayfası gibi konfigürasyonlar bu widget içerisinde yapılır.
/// Bu widget olabilirliğince küçük tutulmalıdır.
final class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',

      /// [CustomSnackBar.messengerKey] değişkeni MaterialApp widget'ı içerisinde tanımlanır.
      scaffoldMessengerKey: CustomSnackBar.messengerKey,

      /// [EasyLocalization] widget'ı, uygulama içerisinde kullanılacak olan dil konfigürasyonlarını yapar.
      /// Bu widget, uygulama başlatıldıktan sonra çalıştırılır.
      /// [context.locale] EasyLocalization paketi içerisinde bulunan
      /// BuildContext için yapılmış bir extension'dan gelir.
      /// [context.locale] bir getter'dır ve uygulama içerisinde kullanılan dilin
      /// Locale tipinde bir nesnesini döndürür.
      /// EasyLocalization.of(context).locale ile aynı işlevi görür.
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: lightTheme,
      themeMode: ChooseThemeMode(
        RemoteConfigManager.getString(
          RemoteConfigKeys.themeMode,
        ),
      ).getThemeMode,
      routerConfig: RouterManager.routes,
    );
  }
}
