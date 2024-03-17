final class FirestoreModel<T> {
  final bool? isSuccess;
  final String? error;
  final T? data;

  FirestoreModel({this.isSuccess, this.error, this.data});
}
