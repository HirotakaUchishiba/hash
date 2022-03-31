import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MemberProfileWidget extends StatelessWidget {
  MemberProfileWidget(
      this.photoUrl,
      this.nickname,
      this.university,
      this.faculty,
      this.bio,
      this.createdAt,
      );
  final String? photoUrl;
  final String? nickname;
  final String? university;
  final String? faculty;
  final String? bio;
  final DateTime? createdAt;

  final double photoSize = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'プロフィール',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: photoSize,
                width: photoSize,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(photoSize / 2),
                  child: CachedNetworkImage(
                    imageUrl: photoUrl!,
                    fit: BoxFit.fitHeight,
                  )
                      ,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      nickname!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(child: Text(bio!)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '大学: ' + university!,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '学部: ' + faculty!,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}