import 'package:erwaa/views/my_orders/orders_details/order_details_body/order_details_body.dart';
import 'package:flutter/material.dart';



class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OrderDetailsBody(),
      ),
    );
  }
}
