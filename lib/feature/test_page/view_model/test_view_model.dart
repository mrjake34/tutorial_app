import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/test_page/model/comments_model.dart';
import 'package:tutorial_app/product/utils/remote_config/remote_config_manager.dart';

final class TestViewModel extends ChangeNotifier {
  List<Comment>? _commentList;

  List<Comment>? get getCommentList => _commentList;

  void getConfigValue() {
    final response = RemoteConfigManager.getString('quest');
    final decodedString = json.decode(response);
    final newList =
        decodedString.map((e) => Comment.fromJson(e)).cast<Comment>().toList();
    _commentList = newList;
    if (!hasListeners) return;
    notifyListeners();
  }
}
