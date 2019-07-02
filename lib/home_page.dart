import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meetup_hibrido/models/member.dart';
import 'package:meetup_hibrido/services/requests/member_request.dart';
import 'package:meetup_hibrido/winner_page.dart';

import 'member_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Member> members = [];
  bool _loading = false;

  @override
  void initState() {
    MemberRequest.getMembers().then((membersResponse) {
      setState(() {
        members = membersResponse;
      });
    });
    super.initState();
  }

  void _selectWinner() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    Random random = new Random();
    int randomIndex = random.nextInt(members.length);

    Member winner = members[randomIndex];

    await Future.delayed(Duration(seconds: 1));

    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return WinnerPage(
          member: winner,
        );
      }),
    );

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (BuildContext context, int index) {
          return MemberCard(
            member: members[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectWinner,
        tooltip: 'Sortear!',
        child: _loading
            ? CircularProgressIndicator(backgroundColor: Colors.white)
            : Icon(Icons.play_arrow),
      ),
    );
  }
}
