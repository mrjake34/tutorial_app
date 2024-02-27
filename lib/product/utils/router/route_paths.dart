/// [RoutePaths] enum sınıfı, GoRouter paketi içerisinde kullanılacak olan sayfa yollarını içerir.
/// Her bir sayfa yolu, bir string değerine sahiptir.
/// Bu sayede sayfa yolları, uygulama içerisinde kullanılacak olan sayfa builder'larına verilebilir.
/// Bu değerler burada verildiği için yazım hatalarının önüne geçilir.
enum RoutePaths {
  initial('/'),
  userDetail('/user-detail'),
  ;

  const RoutePaths(this.path);
  final String path;
}
