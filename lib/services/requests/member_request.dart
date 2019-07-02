import 'dart:convert' as JSON;
import 'package:meetup_hibrido/models/member.dart';
import 'package:meetup_hibrido/services/queries.dart';
import 'package:meetup_hibrido/services/http.dart';

class MemberRequest {
  static Future<List<Member>> getMembers() async {
    List<Member> members = [];

    String jsonResponse = await Http.get(Queries.meetup);

    if (jsonResponse != null) {
      Map<String, dynamic> response = JSON.jsonDecode(jsonResponse);

      for (var member in response['responses'][0]['value']) {
        members.add(Member.fromJson(member));
      }
    }

    return members;
  }
}
