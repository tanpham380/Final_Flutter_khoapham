import 'package:flutter/material.dart';
import 'package:flutter_app_sale_25042023/common/app_constants.dart';
import 'presentation/sign_up/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppConstants.SIGN_IN_ROUTE_NAME: (context) => SignInPage()
      },
      initialRoute: AppConstants.SIGN_IN_ROUTE_NAME,
    );
  }
}