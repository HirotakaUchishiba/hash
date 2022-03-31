import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hash/domain/club.dart';

class LightMusicClubDetailPage extends StatelessWidget {

  final LightMusicClub lightMusicClub;


  LightMusicClubDetailPage(this.lightMusicClub);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '詳細',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: lightMusicClubWidget(context, lightMusicClub),
    );
  }

  Widget lightMusicClubWidget(BuildContext context, LightMusicClub lightMusicClub) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: lightMusicClub.imageURL != null
                ? SizedBox(
              width: double.infinity,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: lightMusicClub.imageURL!,
                fit: BoxFit.fill,
              ),
            )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: <Widget>[
                  Text(lightMusicClub.title, style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('カテゴリ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.category),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('キャンパス',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.campus),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('活動内容',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.activity),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('活動場所',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.place),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('在籍人数',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.people),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('活動日程',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(lightMusicClub.frequency),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('年間予定',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black
                    )
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ここに年間予定を入れる'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('SNSアカウント',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .height * 0.43,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ここにSNSアカウントのURLを入れる'),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}