import '../model/base_model.dart';
import '../model/response_model.dart';

abstract class IServiceManager {
  Future<ResponseModel<T>> get<T extends BaseModel>(
    String path, {
    /// [T] tipi model parametresi parse edilecek verinin tipini belirtir.
    required T model,
  });
}
