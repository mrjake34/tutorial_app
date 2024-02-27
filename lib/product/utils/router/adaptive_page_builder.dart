import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../../feature/home/view/index.dart';

/// [AdaptivePageBuilder] sınıfı, uygulama içerisinde kullanılacak olan sayfa builder'ıdır.
/// [builder] metodu ile geriye [Page] tipinde bir nesne döndürür.
/// Bu nesnenin tipi, platforma göre değişir.
/// Eğer platform iOS ise [CupertinoPage] tipinde bir nesne döndürür.
/// Eğer platform Android ise [MaterialPage] tipinde bir nesne döndürür.
/// Bu sayede uygulama içerisinde kullanılacak olan sayfa builder'ı platforma göre değişir.
final class AdaptivePageBuilder {
  AdaptivePageBuilder._();

  /// [builder] metodu, platforma göre sayfa builder'ı döndürür.
  static Page<T> builder<T>({
    required Widget child,
  }) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(
        child: child,
      );
    }
    return MaterialPage<T>(
      child: child,
    );
  }
}
