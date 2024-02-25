import 'package:flutter/material.dart';

import '../../utils/shared/shared_manager.dart';

final class Starter {
  Starter._();

  static Future<void> init() async {
    /// [WidgetsFlutterBinding.ensureInitialized] metodu, uygulamanın başlatılmasını sağlar.
    /// Bu metot, uygulamanın başlatılmasını sağlamak için kullanılır.
    /// Bu metot, uygulama başlatılmadan önce çalıştırılmalıdır.
    WidgetsFlutterBinding.ensureInitialized();
    await SharedManager.init();
  }
}
