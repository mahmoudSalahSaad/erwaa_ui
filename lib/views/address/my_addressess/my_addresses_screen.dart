import 'package:erwaa/views/address/my_addressess/my_address_body/my_addresses_body.dart';
import 'package:flutter/material.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyAddressBody(),
      ),
    );
  }
}
