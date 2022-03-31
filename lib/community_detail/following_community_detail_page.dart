import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hash/domain/community.dart';
import 'package:hash/community_detail/community_detail_page_model.dart';
import 'package:hash/domain/community_detail.dart';

import '../report/report_page.dart';
import '../user_detail/member_detail_page.dart';

class FollowingCommunityDetailPage extends StatelessWidget {
  final FollowingCommunity followingCommunity;

  FollowingCommunityDetailPage(this.followingCommunity);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommunityDetailPageModel>(
      create: (_) => CommunityDetailPageModel()
        ..fetchFollowingCommunityDetailList(followingCommunity)
        ..getBooleanValue(followingCommunity.id)
        ..getBlockBooleanValue(followingCommunity.creatorUid),

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            followingCommunity.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                     height:80,
                      color: Colors.white,
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.error),
                            SizedBox(
                              width: 10,
                            ),
                            Text('問題を報告する'),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const ReportPage();
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Consumer<CommunityDetailPageModel>(
            builder: (context, model, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Stack(
                      children: [
                        Consumer<CommunityDetailPageModel>(
                          builder: (context, model, child) {
                            final List<FollowingCommunityDetail>?
                                followingCommunityDetails =
                                model.followingCommunityDetails;

                            if (followingCommunityDetails == null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              );
                            }

                            //投稿へのコメント
                            final List<Widget> followingCommunityDetailWidgets =
                                followingCommunityDetails
                                    .map(
                                      (followingCommunityDetails) => Card(
                                        elevation: 0.0,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: CachedNetworkImage(
                                                height: 50,
                                                width: 50,
                                                imageUrl:
                                                    followingCommunityDetails
                                                        .senderImageUrl,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              title: Text(
                                                followingCommunityDetails
                                                    .senderName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(followingCommunityDetails
                                                      .senderUniversity),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(followingCommunityDetails
                                                      .senderFaculty),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                                followingCommunityDetails
                                                                    .message),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            DateFormat.yMMMd(
                                                                    'ja')
                                                                .format(followingCommunityDetails
                                                                    .createdAt
                                                                    .toDate()),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList();

                            return Column(
                              children: [
                                Card(
                                  child: Column(children: <Widget>[
                                    ListTile(
                                      leading: GestureDetector(
                                        child: CachedNetworkImage(
                                          height: 50,
                                          width: 50,
                                          imageUrl:
                                              followingCommunity.creatorImage,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        //TODO:ユーザーアイコンをタップしたら詳細画面に遷移する処理を書く
                                        // onTap:() async {
                                        //   await Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           MemberDetailPage(id ,member),
                                        //     ),
                                        //   );
                                        // },
                                      ),
                                      title: Text(
                                        followingCommunity.creatorName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(followingCommunity
                                              .creatorUniversity),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(followingCommunity
                                              .creatorFaculty),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        CachedNetworkImage(
                                            imageUrl: followingCommunity
                                                .contentsImageUrl),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                        followingCommunity
                                                            .title,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text(
                                                          followingCommunity
                                                              .contents),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        DateFormat.yMMMd('ja')
                                                            .format(
                                                                followingCommunity
                                                                    .createdAt
                                                                    .toDate()),
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      //bookmarkアイコン
                                                      IconButton(
                                                        onPressed:
                                                            () async {
                                                          model.bookmark
                                                              ? await model
                                                                  .deleteBookMark(
                                                                      followingCommunity
                                                                          .id)
                                                              : await model
                                                                  .createBookMark(
                                                                      followingCommunity
                                                                          .id);
                                                        },
                                                        icon: Icon(
                                                          Icons.bookmark,
                                                          size: 25,
                                                          color: model
                                                                  .bookmark
                                                              ? Colors.amber
                                                              : Colors
                                                                  .black12,
                                                        ),
                                                      ),

                                                      //isBlockedアイコン
                                                      IconButton(
                                                        onPressed:
                                                            () async {
                                                          showDialog(
                                                              context: context,
                                                              barrierDismissible: false,
                                                              builder: (_) {
                                                            return AlertDialog(
                                                              title: Text("ブロックの確認"),
                                                              content: Text('この投稿ユーザーをブロックしますか？'),
                                                              actions: [
                                                                TextButton(
                                                                  child: Text("いいえ"),
                                                                  onPressed: () => Navigator.pop(context),
                                                                ),
                                                                TextButton(
                                                                  child: Text("はい"),
                                                                  onPressed: () async {
                                                                    model.isBlocked
                                                                        ? await model.removeBlockList(
                                                                        followingCommunity
                                                                            .id,followingCommunity.creatorUid)
                                                                        : await model.addBlockList(
                                                                        followingCommunity
                                                                            .id,followingCommunity.creatorUid);
                                                                    Navigator.pop(context);
                                                                    Navigator.pop(context);
                                                                    final snackBar = SnackBar(
                                                                      backgroundColor: Colors.black,
                                                                      content: Text('投稿者をブロックしました'),
                                                                    );
                                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.block_outlined,
                                                          size: 25,
                                                          color: model.isBlocked
                                                              ? Colors.red
                                                              : Colors
                                                              .black12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  elevation: 0.0,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: followingCommunityDetailWidgets,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  color: Colors.white,
                  child: SafeArea(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                        labelText: 'メッセージを入力',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            //_handleSubmit(_controller.text);

                            await model.addText(
                              //TODO:ここ引数でidを渡さなくてもmodelの方でFollowingCommunityを引数にしていれば大丈夫説を検証する
                                _controller.text, followingCommunity.id, followingCommunity.creatorUid);
                            await model.fetchFollowingCommunityDetailList(
                                followingCommunity);
                            _controller.text = "";
                          },
                          icon: Icon(Icons.send, size: 20, color: Colors.amber),
                        ),
                      ),
                      controller: _controller,
                      onSubmitted: (String message) async {
                        final db = FirebaseFirestore.instance;
                        final uid = FirebaseAuth.instance.currentUser!.uid;
                        final document = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .get();

                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;

                        await db
                            .collection("communities")
                            .doc("following_communities")
                            .collection("following_community_details")
                            .doc(followingCommunity.id)
                            .collection('messages')
                            .add({
                          "senderName": data['nickname'],
                          "senderUniversity": data['university'],
                          "senderFaculty": data['faculty'],
                          //TODO:メッセージ送信者の性別情報も持たせる
                          //"senderGenderName":data['senderGenderName'],
                          "senderImageUrl": data['photoUrl'],
                          "message": message,
                          "createdAt": DateTime.now()
                        });

                        await model.fetchFollowingCommunityDetailList(
                            followingCommunity);
                        _controller.text = "";
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
              ]),
            ],
          );
        }),
      ),
    );
  }
}