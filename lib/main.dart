import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/home/view/home_view.dart';

/// Uygulamanın başlangıç noktası.
/// Uygulama başlatıldığında, bu sınıf çalışır.
/// Bu bölüm olabildiğince küçük tutulmalıdır.
/// Bu sınıf içerisinde, uygulamanın başlatılması için gerekli olan temel konfigürasyonlar yapılır.
/// Bu aşamada yapılan her işlem, uygulamanın başlatılmasını geciktirebilir.
void main() {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
