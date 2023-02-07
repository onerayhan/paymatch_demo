import 'package:flutter/material.dart';
import 'package:paymatch_demo/routes/welcome.dart';
import 'package:paymatch_demo/routes/login.dart';
import 'package:paymatch_demo/routes/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        routes: {
          '/': (context) => PortfolioView(),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
        },
      );
  }
}

