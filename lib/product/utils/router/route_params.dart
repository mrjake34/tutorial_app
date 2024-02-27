/// [RouteParams] enum sınıfı bir sayfa yolu içerisinde kullanılacak olan parametrelerin isimlerini içerir.
/// Parametrelerin isimleri sadece burada belirlendiği için yazım hatalarının önüne geçilir.
enum RouteParams {
  user('user'),
  ;

  const RouteParams(this.param);
  final String param;
}
