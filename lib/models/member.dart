import 'dart:core';

class Member {
  Member({
    this.name,
    this.thumbLink,
    this.highresLink,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    String defaultImage =
        'https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png';
    String name = json['member']['name'];
    String thumbLink = defaultImage;
    String highresLink = defaultImage;

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
