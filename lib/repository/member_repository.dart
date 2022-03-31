import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

import '../domain/member.dart';


class MemberRepository {
  Future<List<Member>> fetchMembers() async {
    try {
      // セキュリティルールを変更せずに済むので、functionsで取得するようにする
      final functions = FirebaseFunctions.instanceFor(
          app: Firebase.app(), region: 'asia-northeast1');
      final callable = functions.httpsCallable('api-getMembers');
      final result = await callable.call({
        'client': 'app',
        'orderBy': 'createdAt desc',
      });
      final List memberData = result.data['members'];
      return memberData.map((json) => Member.fromJson(json)).toList();
    } on FirebaseFunctionsException catch (e) {
      print(e);
      throw ('CloudFunctionsExceptionが発生しました');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Member> fetchMember(String userId) async {
    try {
      final functions = FirebaseFunctions.instanceFor(
          app: Firebase.app(), region: 'asia-northeast1');
      final callable = functions.httpsCallable('api-getMember');
      final result = await callable.call({'userId': userId});
      final memberData = result.data != null ? result.data['member'] : Member();
      return Member.fromJson(memberData);
    } on FirebaseFunctionsException catch (_) {
      throw ('CloudFunctionsExceptionが発生しました');
    } catch (e) {
      print(e);
      throw ('エラーが発生しました');
    }
  }
}