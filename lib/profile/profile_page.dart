import 'package:firebase_auth/firebase_auth.dart';
import 'package:hash/profile_setting/profile_setting_page.dart';
import 'package:hash/sent_community_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hash/profile/profile_widget.dart';
import 'package:hash/profile/profile_model.dart';

import '../bookmark_community_widget.dart';
import '../landing_page.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..init(),
      child: Scaffold(
          appBar: AppBar(
              title: const Text(
                'マイページ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: false,
              automaticallyImplyLeading: false),
          body: Consumer<ProfileModel>(builder: (context, model, child) {
            final user = model.user;

            if (user == null) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        'プロフィール',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings,color: Colors.grey),
                        onPressed: () async {
                          await Navigator.of(context).push(
                              MaterialPageRoute(
                              builder: (context) => ProfileSettingPage(user),
                              ),
                          );
                          model..init();
                        },
                      ),
                    ]),
                    ProfileWidget(
                      user.photoUrl,
                      user.nickname,
                      user.university,
                      user.faculty,
                      user.bio,
                      user.createdAt,
                    ),

                    Center(
                      child: TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return const LandingPage();
                            }),
                          );
                        },
                        child: Text(
                          'ログアウト',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
