final class FirestoreModel<T> {
  final bool? isSuccess;
  final String? error;
  final T? data;

  FirestoreModel({this.isSuccess, this.error, this.data});
}

final class OtherFirestoreModel<T> {
  final bool isSuccess;
  final String error;
  final T data;

  OtherFirestoreModel({
    required this.isSuccess,
    required this.error,
    required this.data,
  });
}
