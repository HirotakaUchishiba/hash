import 'package:flutter/material.dart';
import 'package:hash/domain/user.dart';
import 'package:hash/repository/user_repository.dart';

class ProfileModel extends ChangeNotifier {
  User? user;
  List<User>? users;
  final _userRepo = UserRepository();

  Future init() async {
    user = await _userRepo.fetchUser();
    notifyListeners();
  }
}