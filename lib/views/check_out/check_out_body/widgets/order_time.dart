import 'package:erwaa/utils/constants.dart';
import 'package:erwaa/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class OrderTime extends StatelessWidget {
  const OrderTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            color: Constants.kMainWhite ,
            borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)) ,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1) ,
                  blurRadius: 58 ,
                  offset: const Offset(0, 0)
              )
            ]
        ),
        child: Column(
          children: [
            Text("ميعاد التوصيل" , style: Constants.checkOutHeader,),
            SizedBox(
              height: getProportionateScreenHeight(10),

            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false ,
                titleCentered: true ,
              ),
              formatAnimationCurve: Curves.bounceIn,

              locale: 'en-US',
            ) ,
            SizedBox(
              height: getProportionateScreenHeight(10),
            ) ,
            Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
              decoration: BoxDecoration(
                color: Constants.kMainDarkBlue ,
                borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1) ,
                      offset: const Offset(0, 0) ,
                      blurRadius: 58
                  )
                ] ,

              ),
              child: Center(
                child: Text("1:40 PM" , style: Constants.mainLightAuthHeader,),
              ),
            ) ,
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),

            Text("11-6-2023 1:40 PM" , style: Constants.checkOutHeader,)


          ],
        ),
      ),
    );
  }
}