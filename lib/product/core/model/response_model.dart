import 'package:tutorial_app/product/core/model/base_model.dart';

import 'base_response_model.dart';

/// [ResponseModel] sınıfı, [BaseResponseModel] sınıfından türetilmiş bir sınıftır.
/// Bu sınıf, response modelleri için kullanılır.
/// [T] tipinde bir data alır ve [ServiceManager] da kullandığı amaca göre düzenlenir.
/// [T] tipi [BaseModel] sınıfından türetilmiş bir sınıf olmalıdır.
/// [BaseModel] Sınıfı içeriğinde, [fromJson] metodu bulunmalıdır.
/// Bu metot, API'den gelen veriyi parse eder.
final class ResponseModel<T extends BaseModel> extends BaseResponseModel {
  ResponseModel({this.data, this.statusCode, this.message});
  final T? data;
  final int? statusCode;
  final String? message;
}
