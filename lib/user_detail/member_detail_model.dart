import 'package:flutter/material.dart';
import 'package:hash/domain/member.dart';
import 'package:hash/repository/member_repository.dart';

class MemberDetailModel extends ChangeNotifier {
  MemberDetailModel(this.id, {this.member});

  final String id;
  Member? member;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future init() async {
    if (member != null) {
      return;
    }
    startLoading();
    await fetchMember();
    endLoading();
  }

  Future fetchMember() async {
    this.member = await MemberRepository().fetchMember(id);
  }
}