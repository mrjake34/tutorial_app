import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [CustomSnackBar] sınıfı, uygulama içerisinde kullanılacak olan
/// snackbar'ları oluşturmak için kullanılır.
/// Bu sınıfın içerisindeki metodlar, uygulama içerisindeki herhangi bir
/// yerden çağrılabilir.
/// Bu sınıfı oluşturmada ki amaç, snackbar'ların tek bir yerden kontrol
/// edilmesini sağlamaktır.
/// Bu sayede, snackbar'ların tasarımı, renkleri, gösterim süresi gibi
/// özellikler tek bir yerden yönetilebilir ve düzenlenebilir.
final class CustomSnackBar {
  /// Bu sınıfın dışarıdan erişilebilir olmaması için
  /// private bir constructor oluşturulur.
  /// Bu sayede, bu sınıfın dışarıdan erişilebilir olmasının önüne geçilir.
  /// Bu sınıfın dışarıdan erişilebilir olmamasının sebebi, bu sınıfın
  /// içerisindeki metodların, sadece bu sınıf içerisinde kullanılması
  /// ve kontrol edilmesi içindir.
  /// Örnek olarak
  /// final snackBar = CustomSnackBar();
  /// şeklinde bir kullanım yapılamaz.
  CustomSnackBar._();

  /// [ScaffoldMessengerState] sınıfından bir nesne oluşturulur.
  /// Bu nesne, snackbar'ların gösterilmesi için kullanılır.
  /// [_messengerKey] değişkeni, bu nesnenin dışarıdan erişilebilir olmasını
  /// engellemek için private olarak tanımlanmıştır.
  /// Bu sayede, bu nesne sadece bu sınıf içerisinde kullanılabilir.
  /// fakat bu nesne static olan metotlar içerisinde kullanılacağı için
  /// bu nesne, static olarak tanımlanmıştır.
  static final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey();

  /// [messengerKey] değişkeni, [_messengerKey] değişkeninin dışarıdan
  /// erişilebilmesi için tanımlanmış bir getter metotdur.
  /// Bu sayede, [_messengerKey] değişkenine dışarıdan erişim sağlanır.
  /// Bu değişken [MaterialApp] widget'ı içerisinde tanımlanır,
  /// bu sayede, uygulama içerisinde [messengerKey] snackbar'ları
  /// göstermek için tanımlanmış olur.
  static GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  /// [showSnackBar] metodu, snackbar göstermek için kullanılır.
  /// Bu metot, [text] parametresi alır ve bu parametre ile snackbar
  /// gösterilir.
  /// [showSnackBar] metodu dışarıdan erişilebilir olması için static
  /// olarak tanımlanmıştır.
  /// Örnek kullanım:
  /// CustomSnackBar.showSnackBar('SnackBar Example.');
  /// şeklinde kullanılır.
  static void showSnackBar(String? text) {
    /// Eğer [text] null ise, metottan çıkılır.
    if (text == null) return;

    /// [SnackBar] sınıfından bir nesne oluşturulur.
    /// Bu nesne, snackbar'ın tasarımı, rengi, gösterim süresi gibi
    /// özelliklerini içerir.
    /// [SnackBar] sınıfı, [content] parametresi alır ve bu parametre
    /// ile snackbar'ın içeriği belirlenir.
    /// [Text] sınıfı, snackbar'ın içeriğini belirlemek için kullanılır.
    final snackBar = SnackBar(content: Text(text));

    /// [_messengerKey] değişkeni, [ScaffoldMessengerState] sınıfının
    /// bir nesnesine sahiptir.
    /// Bu nesne, snackbar'ların gösterilmesi için kullanılır.
    /// Bu nesne, [showSnackBar] metodu ile snackbar göstermek için
    /// kullanılır.
    /// [removeCurrentSnackBar] metodu, eğer ekranda bir snackbar varsa,
    /// bu snackbar'ı kaldırır.
    /// [currentState] değişkeni mevcut durumu temsil eder.
    /// Eğer mevcut durum null değilse, [showSnackBar] metodu ile
    /// snackbar gösterilir.
    if (_messengerKey.currentState != null) {
      _messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  /// [errorSnackBar] metodu, hata durumunda snackbar göstermek için
  /// kullanılır.
  /// Bu metot, [text] parametresi alır ve bu parametre ile snackbar
  /// gösterilir.
  static void errorSnackBar(String? text) {
    if (text == null) return;

    /// [SnackBar] sınıfından bir nesne oluşturulur.
    /// Bu nesne, snackbar'ın tasarımı, rengi, gösterim süresi gibi
    /// özelliklerini içerir.
    /// [action] parametresi, snackbar'ın içerisinde bir buton
    /// göstermek için kullanılır.
    /// [onPressed] parametresi, butona tıklandığında çalışacak
    /// metodu belirtir.
    /// Metot, butona tıklandığında snackbar'ı kaldırmak için
    /// kullanılır.
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text.tr(),
        style: const TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Kapat',
        onPressed: () {
          _messengerKey.currentState!.hideCurrentSnackBar();
        },
        textColor: Colors.white,
      ),
    );

    if (_messengerKey.currentState != null) {
      _messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  static void successSnackBar(String s) {}
}
