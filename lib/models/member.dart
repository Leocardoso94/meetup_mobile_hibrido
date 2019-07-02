import 'dart:core';

class Member {
  Member({
    this.name,
    this.thumbLink,
    this.highresLink,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    String name = json['member']['name'];
    String thumbLink = '';
    String highresLink = '';

    if (json['member']['photo'] != null) {
      thumbLink = json['member']['photo']['thumb_link'];
      highresLink = json['member']['photo']['highres_link'];
    }

    return Member(
      name: name,
      thumbLink: thumbLink,
      highresLink: highresLink,
    );
  }

  String name;
  String thumbLink;
  String highresLink;

  @override
  String toString() {
    return 'Name: $name - ThumbLink: $thumbLink - HighThumb: $highresLink\n';
  }
}
