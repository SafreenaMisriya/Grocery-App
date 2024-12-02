
import 'package:billing_system_app/model/cart_model.dart';
import 'package:billing_system_app/view/splash/splash.dart';
import 'package:billing_system_app/view_model/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/navigations/navigations.dart';
final cartNotifier = CartNotifier();

void main() {
  runApp(
    ValueListenableBuilder<List<CartItem>>(
      valueListenable: cartNotifier,
      builder: (context, cartItems, child) {
        return MyApp(cartItems: cartItems);
      },
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required List<CartItem> cartItems});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          ),
            primaryColor: Colors.white,
           ),
        home: const IntroScreen(),
      );
  }
}
