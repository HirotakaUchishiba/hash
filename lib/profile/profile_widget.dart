import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget(
      this.photoUrl,
      this.nickname,
      this.university,
      this.faculty,
      this.bio,
      this.createdAt,
      );
  final String photoUrl;
  final String nickname;
  final String university;
  final String faculty;
  final String bio;
  final Timestamp createdAt;

  final double photoSize = 150;

  @override
  Widget build(BuildContext context) {
    if (nickname == null) {
      return Center(child: Text('ユーザーの取得に失敗しました'));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: photoSize,
                  width: photoSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(photoSize / 2),
                    child: photoUrl != null
                        ? FittedBox(
                          child: CachedNetworkImage(
                      imageUrl: photoUrl,
                    ),
                      fit: BoxFit.fill,
                        ) : Image.asset('assets/placeholder/placeholder.png')
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                nickname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10),
            Container(child: Text(bio,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,)),
            SizedBox(
              height:10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '大学: ' + university,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    '学部: ' + faculty,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}