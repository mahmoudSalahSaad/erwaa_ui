import 'package:erwaa/views/home/home_screen.dart';
import 'package:erwaa/views/profile/profile_body/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 2),
    );
  }
}
