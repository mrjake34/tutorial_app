part of '../cache_manager.dart';

mixin CacheRepositoryMixin {
  Future<bool> saveFcmToken(String token) async {
    return CacheManager.instance.setData(token, PreferenceKey.fcmToken);
  }

  String? getFcmToken() {
    return CacheManager.instance.getData<String>(PreferenceKey.fcmToken);
  }

  // Delete FCM token
  Future<bool> deleteFcmToken() async {
    return CacheManager.instance.clearData(PreferenceKey.fcmToken);
  }
}
