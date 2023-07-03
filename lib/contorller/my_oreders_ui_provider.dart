import 'package:flutter/cupertino.dart';

class MyOrdersUiProvider extends ChangeNotifier{


  chnageOrdersState({List<Map<String , dynamic>>? ordersFilters , int? index}){
    for(int i  = 0 ; i < ordersFilters!.length ; i++){
      if(i == index){
        ordersFilters[index!]['state'] = true ;

      }else{
        ordersFilters[i]['state'] = false ;
      }
    }
    notifyListeners();
  }
}