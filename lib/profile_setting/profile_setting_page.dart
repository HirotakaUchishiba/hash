import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hash/profile_setting/profile_setting_model.dart';
import 'package:provider/provider.dart';

import '../domain/user.dart';

class ProfileSettingPage extends StatelessWidget {
  ProfileSettingPage(this.user);

  User user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileSettingModel>(
      create: (_) =>
          ProfileSettingModel(user.nickname, user.bio, user.photoUrl),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'プロフィール編集',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child:
                Consumer<ProfileSettingModel>(builder: (context, model, child) {
              void _profileEdit() async {
                try {
                  await model.updateProfile();
                  Navigator.of(context).pop();
                } catch (e) {
                  null;
                }
              }

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text('プロフィール画像')],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      child: SizedBox(
                          width: 150,
                          height: 150,
                          child: model.imageFile != null
                              ? FittedBox(
                                  child: Image.file(model.imageFile!),
                                  fit: BoxFit.fill,
                                )
                              : FittedBox(
                                  child: CachedNetworkImage(
                                      imageUrl: user.photoUrl),
                                  fit: BoxFit.fill,
                                )),
                      onTap: () async {
                        await model.pickImage();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('名前'))],
                  ),
                  TextFormField(
                    initialValue: user.nickname,
                    onChanged: (text) {
                      model.nickname = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Container(child: Text('自己紹介'))],
                  ),
                  TextFormField(
                    initialValue: user.bio,
                    onChanged: (text) {
                      model.bio = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () async {
                          _profileEdit();
                        },
                        child: Text(
                          '編集する',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
