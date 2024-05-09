import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';
import 'package:tutorial_app/product/core/model/response_model.dart';
import 'package:tutorial_app/product/core/service/iservice_manager.dart';

final class DioServiceManager extends IServiceManager {
  DioServiceManager({required this.baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: _headers));
  }

  final _headers = {
    'Content-Type': 'application/json',
  };

  late Dio _dio;
  final String baseUrl;
  @override
  Future<ResponseModel<T>> get<T extends BaseModel>(String path,
      {required T model}) async {
    final Response response;

    try {
      response = await _dio.get('$baseUrl$path');

      /// [response.statusCode] 200(HttpStatus.ok) değilse, hata döner.
      if (response.statusCode != HttpStatus.ok) {
        return ResponseModel(
            message: response.statusMessage, statusCode: response.statusCode);
      }
      final encodedData = json.encode(response.data);
      final parsedModel = model.fromJson(encodedData);
      return ResponseModel(data: parsedModel, statusCode: response.statusCode);
    } on DioException catch (e) {
      return ResponseModel(message: e.message);
    }
  }
}
