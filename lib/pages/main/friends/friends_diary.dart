import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:haruapp/widgets/common/writing.dart';

class FriendsDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
      ),
      body: Writing(),
    );
  }
}