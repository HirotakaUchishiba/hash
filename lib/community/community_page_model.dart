import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash/domain/community.dart';

import '../domain/block.dart';

class CommunityPageModel extends ChangeNotifier {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  //followingCommunityWidget
  List<FollowingCommunity>? followingCommunities;
  List<BlockedUser>? blockedUsers;

  Future<void> fetchFollowingCommunityList() async {
    final getBlockedUsers = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('blocked_users')
        .get();

    //ここでblockedUsersをget
    final List<BlockedUser> blockedUsers =
    getBlockedUsers.docs.map((DocumentSnapshot document) {
      final String id = document.id;
      return BlockedUser(id);
    }).toList();
    this.blockedUsers = blockedUsers.toList();
    notifyListeners();

    final getCommunities = await FirebaseFirestore.instance
        .collection('communities')
        .doc('following_communities')
        .collection('following_community_details')
        .get();

    final List<FollowingCommunity> followingCommunities =
    getCommunities.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String creatorUid = data['creatorUid'];
      final String title = data['title'];
      final String contents = data['contents'];
      final String creatorName = data['creatorName'];
      final String creatorImage = data['creatorImage'];
      final String creatorUniversity = data['creatorUniversity'];
      final String creatorFaculty = data['creatorFaculty'];
      final String? contentsImageUrl = data['contentsImageUrl'];
      final Timestamp createdAt = data['createdAt'];
      final Timestamp updatedAt = data['updatedAt'];

      return FollowingCommunity(
          id,
          creatorUid,
          title,
          contents,
          creatorName,
          creatorImage,
          creatorUniversity,
          creatorFaculty,
          contentsImageUrl!,
          createdAt,
          updatedAt);
    }).toList();

    this.followingCommunities = followingCommunities.where((community) {
      return !(blockedUsers.map((blockedUser) => blockedUser.id).contains(community.creatorUid));
    }).toList();
    notifyListeners();
  }


  Future delete(CollegeLifeCommunity community) {
    return FirebaseFirestore.instance
        .collection('communities')
        .doc(community.id)
        .delete();
  }
}