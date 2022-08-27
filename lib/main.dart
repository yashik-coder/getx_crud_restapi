import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Src/config/AppTheme.dart';
import 'Src/screen/loginpage.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Getx crud',
      home: LoginPage(),
    );
  }
}
