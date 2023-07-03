import 'package:flutter/material.dart';

import 'body/pass_change_body.dart';

class PassChangeScreen extends StatelessWidget {
  const PassChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PassChangeBody(),
      ),
    );
  }
}
