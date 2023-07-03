import 'package:flutter/material.dart';

import 'body/change_profile_body.dart';

class ProfileChangeScreen extends StatelessWidget {
  const ProfileChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfilechangeBody(),
      ),
    );
  }
}
