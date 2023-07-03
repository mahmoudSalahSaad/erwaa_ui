import 'package:erwaa/views/home/home_screen.dart';
import 'package:erwaa/views/my_orders/body/my_orders_body.dart';
import 'package:flutter/material.dart';



  class myOrdersScreen extends StatefulWidget {
  const myOrdersScreen({Key? key}) : super(key: key);

  @override
  State<myOrdersScreen> createState() => _myOrdersScreenState();
}

class _myOrdersScreenState extends State<myOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyOrdersBody(),

      ),
      bottomNavigationBar: CustomNavigationBar(selectedIndex: 1),
    );
  }
}
