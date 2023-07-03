import 'package:erwaa/components/applocal_controller.dart';
import 'package:erwaa/components/locale.dart';
import 'package:erwaa/contorller/authUIProvider.dart';
import 'package:erwaa/contorller/cart_provider.dart';
import 'package:erwaa/contorller/data_layer/user_provider.dart';
import 'package:erwaa/contorller/my_oreders_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/auth/login_register/login_screen.dart';


var sharedPref ;
void main() {
  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthUIProvider()) , 
      ChangeNotifierProvider(create: (_)=> CartProvider()) ,
      ChangeNotifierProvider(create: (_)=> MyOrdersUiProvider()) , 
      ChangeNotifierProvider(create: (_)=> UserProvider())
    ] ,
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      title: 'Erwaa',
      locale:controller.initial,
      translations: MyLocale(),
      debugShowCheckedModeBanner: false,
      builder: (context , child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      },
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen()
      },
    );
  }
}


