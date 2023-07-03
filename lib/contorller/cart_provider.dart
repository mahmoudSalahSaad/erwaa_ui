import 'package:erwaa/views/general_widgets/system_dialogs.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {



  CartProvider (){
    _totalPrice = 0 ;
    _itemPrice = 0 ;
    _itemQty = 10 ;
  }
  final bool _isLoading = false ;

  double _totalPrice = 0 ;
  double? _itemPrice ;

  int _itemQty = 10 ;

  int get itemQty {
    return _itemQty ;
  }

  set setItemQty (int qty){
    _itemQty = qty ;

  }
  bool get isLoading {
    return _isLoading ;
  }
  double get totalPrice{
    return _totalPrice ;
  }
  set setTotalPrice (double price) {
    _totalPrice = price ;

  }


  double get itemPrice {
    return _itemPrice! ;
  }


  set setItemPrice(double price){
    _itemPrice = price ;

  }


  addQty(){
    _itemQty ++ ;
    _totalPrice = _itemPrice ! * _itemQty  ;


    notifyListeners();
  }



  removeQty(context){
    _itemQty -- ;

    if(_itemQty < 10){
      _itemQty ++ ;
      SystemDialogs.dialog(context ,title: "عفوا" , message: "الحد الأدنى لاختيار الوحدات هوا 10");
    }else{
      _totalPrice = _itemPrice ! * _itemQty  ;
    }

    notifyListeners();
  }













}