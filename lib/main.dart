import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/view/home_view.dart';
import 'package:tutorial_app/product/core/starter/starter.dart';
import 'package:tutorial_app/product/utils/localization/localization_manager.dart';

import 'product/utils/snackbar/custom_snackbar.dart';

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

  /// Uygulama başlatılır.
  /// runApp metodu, uygulamanın başlatılmasını sağlar.
  /// runApp metodu içerisine, uygulamanın başlangıç widget'ı verilir.
  /// [LocalizationManager] widget'ı, uygulama içerisinde kullanılacak olan dil konfigürasyonlarını yapar.
  /// Bu işlem uygulama başlatılmadan önce yapılmalıdır.
  runApp(
    LocalizationManager(
      child: const MyApp(),
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
    return MaterialApp(
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
