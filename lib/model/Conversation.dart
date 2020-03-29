import 'package:flutter/material.dart';
import 'package:simpleflutter/constants.dart' show AppColors;

class Conversation {
  const Conversation(
      {@required this.avatar,
      @required this.title,
      this.titleColor: 0xff000000,
      this.des,
      @required this.createAt,
      this.isMute: false,
      this.unreadMsgCount: 0,
      this.displayDot: false})
      : assert(avatar != null),
        assert(title != null),
        assert(createAt != null);

  final String avatar;
  final String title;
  final int titleColor;
  final String des;
  final String createAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;
}

const List<Conversation> MockConversations = [
  
];
