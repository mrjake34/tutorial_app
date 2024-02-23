import 'package:tutorial_app/product/core/model/base_model.dart';

import 'base_response_model.dart';

/// ResponseModel sınıfı, [BaseResponseModel] sınıfından türetilmiş bir sınıftır.
/// Bu sınıf, response modelleri için kullanılır.
/// [T] tipinde bir data alır ve ServiceManager da kullandığı amaca göre düzenlenir.
/// Bu [T] tipi data bir [String] tipinde olabilir yada parse edilmiş bir Model olabilir
final class ResponseModel<T extends BaseModel> extends BaseResponseModel {
  ResponseModel({this.data, this.statusCode, this.message});
  final T? data;
  final int? statusCode;
  final String? message;
}
