part of '../cache_manager.dart';

mixin CacheModelsMixin {
  /// [saveLoginModelToList] metodu [LoginRequestModel]
  /// tipinde bir model alır ve
  /// bu modeli [List<LoginRequestModel>] tipinde bir listeye ekler.
  ///
  /// Model eklenirse true döner.
  /// Model eklenemezse false döner.
  Future<bool> saveLoginModelToList(LoginRequestModel model) async {
    final email = model.email;
    if (email == null) return false;
    final loginModelList = await getLoginModelList();
    if (loginModelList == null) {
      return CacheManager.instance.setDataList([
        jsonEncode(model.toJson()),
      ], PreferenceKey.loginModel);
    }
    if (loginModelList.any((element) => element.email == email)) {
      loginModelList.removeWhere((element) => element.email == email);
    }
    loginModelList.add(model);
    final jsonData = loginModelList.map((e) => jsonEncode(e.toJson())).toList();
    await CacheManager.instance.clearData(PreferenceKey.loginModel);
    return CacheManager.instance.setDataList(
      jsonData,
      PreferenceKey.loginModel,
    );
  }

  /// [deleteLoginModelFromList] metodu
  /// [String] tipinde bir kullanıcı adı alır ve
  /// bu kullanıcı adına sahip olan [LoginRequestModel] tipindeki modeli siler.
  ///
  /// Model silinirse true döner.
  /// Model silinemezse false döner.
  Future<bool> deleteLoginModelFromList(String email) async {
    final data = await getLoginModelList();
    if (data == null) return false;

    data.removeWhere((element) => element.email == email);
    final jsonData = data.map((e) => jsonEncode(e.toJson())).toList();
    await CacheManager.instance.clearData(PreferenceKey.loginModel);
    return CacheManager.instance.setDataList(
      jsonData,
      PreferenceKey.loginModel,
    );
  }

  /// [getLoginModelList] metodu
  /// [List<LoginRequestModel>] tipinde bir liste döner.
  ///
  /// Liste dönerse [List<LoginRequestModel>] tipinde liste döner.
  /// Liste dönemezse null döner.
  ///
  /// Verilerin tipi [List<String>] olduğu için
  /// [List<LoginRequestModel>] tipine dönüştürülür.
  Future<List<LoginRequestModel>?> getLoginModelList() async {
    final data = CacheManager.instance.getDataList(PreferenceKey.loginModel);
    if (data == null) return null;
    try {
      final loginModelList =
          data
              .map(
                (e) => LoginRequestModel.fromJson(
                  jsonDecode(e) as Map<String, dynamic>,
                ),
              )
              .cast<LoginRequestModel>()
              .toList();
      return loginModelList;
    } catch (e) {
      await CacheManager.instance.clearData(PreferenceKey.loginModel);
      return null;
    }
  }
}
