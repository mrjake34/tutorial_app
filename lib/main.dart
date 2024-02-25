import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/view/home_view.dart';
import 'package:tutorial_app/product/core/starter/starter.dart';

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
  runApp(const MyApp());
}

/// [MaterialApp] uygulamanın temel widget'ıdır.
/// Bu widget, uygulamanın temel konfigürasyonlarını yapar.
/// Uygulama içerisinde kullanılacak tema, başlangıç sayfası gibi konfigürasyonlar bu widget içerisinde yapılır.
/// Bu widget olabilirliğince küçük tutulmalıdır.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      /// [CustomSnackBar.messengerKey] değişkeni MaterialApp widget'ı içerisinde tanımlanır.
      scaffoldMessengerKey: CustomSnackBar.messengerKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
