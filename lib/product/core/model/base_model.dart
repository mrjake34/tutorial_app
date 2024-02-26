import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  const BaseModel();

  Map<String, dynamic> toJson();
  T fromJson(dynamic json);
}
