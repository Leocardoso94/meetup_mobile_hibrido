import 'package:flutter/material.dart';
import 'package:meetup_hibrido/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key key,
    @required this.member,
  }) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(member.thumbLink),
              radius: 34,
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                Text(
                  member.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
