import 'package:tutorial_app/feature/home/model/user_response_model.dart';

import '../../../product/core/service/service_manager.dart';

final class HomeService {
  HomeService();

  final _service = ServiceManager();

  Future<UsersResponseModel> getUsers() async {
    final response = await _service.get<UsersResponseModel>('users',
        model: UsersResponseModel());
    if (response.statusCode != 200) {
      return UsersResponseModel(
          error: response.message, statusCode: response.statusCode);
    }
    return UsersResponseModel(
        users: response.data?.users, statusCode: response.statusCode);
  }

  Future<UsersResponseModel> getUser(int id) async {
    final response = await _service.get<UsersResponseModel>('users/$id',
        model: UsersResponseModel());
    if (response.statusCode != 200) {
      return UsersResponseModel(
          error: response.message, statusCode: response.statusCode);
    }
    return UsersResponseModel(
        user: response.data?.user, statusCode: response.statusCode);
  }
}
