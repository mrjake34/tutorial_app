import 'package:tutorial_app/feature/home/service/home_service.dart';
import 'package:tutorial_app/feature/photos/service/photos_service.dart';
import 'package:tutorial_app/product/utils/cache/cache_manager.dart';
import 'package:tutorial_app/product/utils/getit/product_state_container.dart';
import 'package:tutorial_app/product/utils/remote_config/remote_config_manager.dart';
import 'package:tutorial_app/product/utils/shared/shared_manager.dart';

final class ProductStateItems {
  static RemoteConfigManager get remoteConfig =>
      ProductStateContainer.get<RemoteConfigManager>();
  static SharedManager get sharedManager =>
      ProductStateContainer.get<SharedManager>();
  static HomeService get homeService =>
      ProductStateContainer.get<HomeService>();
  static PhotosService get photoService =>
      ProductStateContainer.get<PhotosService>();
  static CacheManager get cacheManager =>
      ProductStateContainer.get<CacheManager>();
}
