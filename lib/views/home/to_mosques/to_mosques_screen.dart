import 'package:erwaa/views/home/to_mosques/to%20mosques%20body/to_mosques_body.dart';
import 'package:flutter/material.dart';


class ToMosquesScreen extends StatelessWidget {
  const ToMosquesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:false,
      body: ToMosquesBody(),
    );
  }
}
