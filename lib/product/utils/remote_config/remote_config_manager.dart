import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';

final class RemoteConfigManager {
  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> init() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
  }

  static Future<void> fetchAndActivate() async {
    await remoteConfig.fetchAndActivate();
  }

  static String getString(String key) {
    final reponse = remoteConfig.getString(key);
    return reponse;
  }

  static bool getBool(String key) {
    final reponse = remoteConfig.getBool(key);
    return reponse;
  }

  Future<void> setDefaults(Map<String, dynamic> defaults) async {
    await remoteConfig.setDefaults(defaults);
  }

  static Stream<RemoteConfigUpdate> get onConfigChanged =>
      remoteConfig.onConfigUpdated;
}
