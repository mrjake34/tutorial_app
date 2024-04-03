import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/feature/home/model/user_model.dart';
import 'package:tutorial_app/feature/home/service/home_service.dart';
import 'package:tutorial_app/feature/photos/model/photos.dart';
import 'package:tutorial_app/feature/photos/service/photos_service.dart';

void main() {
  late final HomeService homeService;
  late final PhotosService photosService;

  setUp(() {
    homeService = HomeService();
    photosService = PhotosService();
  });

  test('Home Service', () async {
    final response = await homeService.getUsers();

    expect(response.statusCode, HttpStatus.ok);
    expect(response.users, isNotNull);
    expect(response.users?.cast<UserModel>(), isNotEmpty);
  });

  test('Photo Service', () async {
    final response = await photosService.getPhotos(10, 20);

    expect(response.statusCode, HttpStatus.ok);
    expect(response.photos, isNotNull);
    expect(response.photos?.photos?.cast<Photos>(), isNotEmpty);
  });
}
