import 'package:go_router/go_router.dart';
import 'package:tutorial_app/feature/auth/login/view/login_view.dart';
import 'package:tutorial_app/feature/splash/view/splash_view.dart';
import 'package:tutorial_app/product/utils/router/adaptive_page_builder.dart';
import 'package:tutorial_app/product/utils/router/route_paths.dart';

import '../../../feature/auth/register/view/register_view.dart';
import '../../../feature/home/model/user_model.dart';
import '../../../feature/home/view/user_detail_view.dart';

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
        /// [path] parametresi, sayfa yolu içerir.
        /// enum olarak kullanılmasının sebebi, yazım hatalarının önüne geçilmesidir.
        /// Bu sayede sayfa yolları, uygulama içerisinde aynı şekilde kullanılabilir.
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
      GoRoute(
        path: RoutePaths.login.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.register.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
