import 'package:go_router/go_router.dart';
import 'package:tutorial_app/feature/home/view/index.dart';
import 'package:tutorial_app/feature/splash/view/splash_view.dart';
import 'package:tutorial_app/product/utils/router/adaptive_page_builder.dart';
import 'package:tutorial_app/product/utils/router/route_paths.dart';

import '../../../feature/home/view/src/user_detail_view.dart';

/// [RouterManager] sınıfı, uygulama içerisinde kullanılacak olan sayfa yollarını içerir.
/// Bu sınıf, GoRouter paketi içerisinde kullanılacak olan sayfa builder'ları içerir.
/// Bu sayede uygulama içerisinde kullanılacak olan sayfa builder'ları tek bir yerde toplanmış olur.
final class RouterManager {
  RouterManager._();

  /// [routes] getter metodu, uygulama içerisinde kullanılacak olan sayfa builder'ları döndürür.
  static GoRouter get routes => _routes;

  /// [_routes] değişkeni, uygulama içerisinde kullanılacak olan sayfa builder'ları içerir.
  /// Bu değişken, [GoRouter] tipinde bir nesnedir.
  /// private olarak tanımlandığı için, bu değişken sadece bu sınıf içerisinde kullanılabilir.
  static final _routes = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.initial.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.userDetail.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: UserDetailView(user: state.extra as UserModel),
        ),
      ),
    ],
  );
}
