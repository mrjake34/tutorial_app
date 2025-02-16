part of '../cache_manager.dart';

mixin CacheAuthMixin {
  /// [saveToken] metodu [String] tipinde bir token alır ve
  /// bu tokenı [PreferenceKey.token] anahtarına kaydeder.
  ///
  /// Token kaydedilirse true döner.
  /// Token kaydedilemezse false döner.
  Future<bool> saveToken(String token) async {
    return CacheManager.instance.setData(token, PreferenceKey.token);
  }

  /// [getToken] metodu [String] tipinde bir token döner.
  ///
  /// Token dönerse [String] tipinde token döner.
  /// Token dönemezse null döner.
  Future<String?> getToken() async {
    return CacheManager.instance.getData(PreferenceKey.token);
  }

  /// [deleteToken] metodu
  /// [String] tipinde bir token alır ve
  /// bu tokenı siler.
  ///
  /// Token silinirse true döner.
  /// Token silinemezse false döner.
  Future<bool> deleteToken() async {
    return CacheManager.instance.clearData(PreferenceKey.token);
  }

  Future<String?> getUserId() async {
    return CacheManager.instance.getData(PreferenceKey.userId);
  }

  Future<bool> saveUserId(String userId) async {
    return CacheManager.instance.setData(userId, PreferenceKey.userId);
  }

  Future<bool> deleteUserId() async {
    return CacheManager.instance.clearData(PreferenceKey.userId);
  }

  Future<bool> saveOtpToken(String token) async {
    return CacheManager.instance.setData(token, PreferenceKey.otpToken);
  }

  Future<String?> getOtpToken() async {
    return CacheManager.instance.getData(PreferenceKey.otpToken);
  }

  Future<bool> deleteOtpToken() async {
    return CacheManager.instance.clearData(PreferenceKey.otpToken);
  }
}
