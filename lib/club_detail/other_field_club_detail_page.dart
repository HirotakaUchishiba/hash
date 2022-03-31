import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hash/domain/club.dart';

class OtherFieldClubDetailPage extends StatelessWidget {

  final OtherFieldClub otherFieldClub;


  OtherFieldClubDetailPage(this.otherFieldClub);

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
      body: otherFieldClubWidget(context, otherFieldClub),
    );
  }

  Widget otherFieldClubWidget(BuildContext context, OtherFieldClub otherFieldClub) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: otherFieldClub.imageURL != null
                ? SizedBox(
              width: double.infinity,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: otherFieldClub.imageURL!,
                fit: BoxFit.fill,
              ),
            )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: <Widget>[
                  Text(otherFieldClub.title, style: TextStyle(fontSize: 22,
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
                Text(otherFieldClub.category),
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
                Text(otherFieldClub.campus),
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
                Text(otherFieldClub.activity),
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
                Text(otherFieldClub.place),
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
                Text(otherFieldClub.people),
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
                Text(otherFieldClub.frequency),
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