import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
