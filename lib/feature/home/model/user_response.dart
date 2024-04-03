import 'user_model.dart';

class UserResponse {
  bool? success;
  String? message;
  int? totalUsers;
  int? offset;
  int? limit;
  List<UserModel>? users;

  UserResponse({
    this.success,
    this.message,
    this.totalUsers,
    this.offset,
    this.limit,
    this.users,
  });

  UserResponse copyWith({
    bool? success,
    String? message,
    int? totalUsers,
    int? offset,
    int? limit,
    List<UserModel>? users,
  }) {
    return UserResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      totalUsers: totalUsers ?? this.totalUsers,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'total_users': totalUsers,
      'offset': offset,
      'limit': limit,
      'users': users,
    };
  }

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      totalUsers: json['total_users'] as int?,
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      "Response(success: $success,message: $message,totalUsers: $totalUsers,offset: $offset,limit: $limit,users: $users)";

  @override
  int get hashCode =>
      Object.hash(success, message, totalUsers, offset, limit, users);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponse &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          message == other.message &&
          totalUsers == other.totalUsers &&
          offset == other.offset &&
          limit == other.limit &&
          users == other.users;
}
