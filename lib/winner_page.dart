import 'package:flutter/material.dart';
import 'package:meetup_hibrido/models/member.dart';

class WinnerPage extends StatelessWidget {
  const WinnerPage({
    Key key,
    @required this.member,
  }) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O vencedor(a) é...'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                member.highresLink,
              ),
              radius: 60,
            ),
          ),
          Text(
            member.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
