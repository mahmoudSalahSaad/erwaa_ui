import 'package:erwaa/views/home/home_screen.dart';
import 'package:erwaa/views/home/to_homes/body/to_home_body.dart';
import 'package:flutter/material.dart';

class ToHomeScreen extends StatelessWidget {
  const ToHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ToHomeBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 0),
    );
  }
}
