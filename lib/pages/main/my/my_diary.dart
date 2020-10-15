import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/bottom_navigation.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:haruapp/widgets/common/writing.dart';

class MyDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
      ),
      body: Writing(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}