import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash/domain/member.dart';
import 'package:provider/provider.dart';

import '../member_profile_widget.dart';
import 'member_detail_model.dart';

class MemberDetailPage extends StatelessWidget {
  MemberDetailPage(this.id, this.member);

  final String id;
  final Member? member;

  final double photoSize = 80;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberDetailModel>(
      create: (_) => MemberDetailModel(id, member: member)
        ..init(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('メンバー'),
        ),
        body: Consumer<MemberDetailModel>(
          builder: (context, model, child) {
            final member = model.member;
            if (member == null) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MemberProfileWidget(
                      member.id,
                      member.nickname,
                      member.university,
                      member.faculty,
                      member.email,
                      member.createdAt,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
