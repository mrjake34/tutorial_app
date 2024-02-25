import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part '_google_maps_widget.dart';
part '_apple_maps_widget.dart';

/// Bu widget harita gösterimi için kullanılır.
/// [latitude] ve [longitude] parametreleri haritanın gösterileceği konumu belirtir.
/// [title] parametresi sayfa başlığını belirtir.
/// [latitude], [longitude] ve [title] parametreleri zorunludur.
/// Bu sebeple required olarak belirtilmiştir.
/// [_GoogleMapWidget] ve [_AppleMapWidget] widget'ları platforma göre farklılık gösterir.
/// Bu sebeple [Platform] sınıfı kullanılarak platform kontrolü yapılır.
/// Platforma göre uygun widget döner.
/// Platform kontrolü için [Builder] widget'ı kullanılır.
/// Hiçbir platforma uygun değilse, desteklenmeyen platform uyarısı döner.
/// [_GoogleMapWidget] ve [_AppleMapWidget] widget'ları dışarıdan erişim olmaması için
/// _(private) ile başlar ve part olarak ayrı dosyalarda tanımlanmıştır.
/// Bu widget'lar sadece bu dosyada kullanılır.
/// [_AppleMapWidget] örnek olarak eklenmiştir, onun yerine Huawei Map, Yandex Map gibi
/// farklı bir map kullanılabilir, farklı cihazlar ve platformlar için.
final class MapsView extends StatelessWidget {
  const MapsView({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
  });
  final double latitude;
  final double longitude;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Builder(
        builder: (context) {
          if (Platform.isAndroid) {
            return _GoogleMapWidget(latitude: latitude, longitude: longitude);
          } else if (Platform.isIOS) {
            return _AppleMapWidget(latitude: latitude, longitude: longitude);
          }
          return const Center(
            child: Text('Unsupported platform for Map.'),
          );
        },
      ),
    );
  }
}
