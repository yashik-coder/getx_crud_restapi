import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_restapi/Src/api/api.dart';
import 'package:getx_crud_restapi/Src/constants/appcolors.dart';
import 'package:getx_crud_restapi/Src/screen/bottombar.dart';
import 'package:getx_crud_restapi/Src/widgets/kText.dart';

//
class LoginSignupController extends GetxController {
  final email = RxString('');
  final password = RxString('');

  final _dio = Dio();

  login(BuildContext context) async {
    try {
      update();
      final res = await _dio.post('$baseurl/login', data: {
        'email': email.value,
        'password': password.value,
      });
      if (res.statusCode == 200) {
        Get.snackbar('Sucess', 'Login Sucess ${res.data}',
            colorText: white, backgroundColor: blueGrey);

        print(res.data);
        print('Login Sucess');
        Get.to(Bottombar());
        return res.data;
      }
    } catch (e) {
      print(e.toString());

      final snackBar = SnackBar(
          content: KText(
        text: 'Username and Password is Incorrect ',
        color: white,
        maxLines: 5,
      ));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  register(BuildContext context) async {
    try {
      final res = await _dio.post('$baseurl/register', data: {
        'email': email.value,
        'password': password.value,
      });

      if (res.statusCode == 200) {
        Get.snackbar(
          'Sucess',
          'Sucessfully Register ${res.data}',
          colorText: white,
          backgroundColor: blueGrey,
        );
        print(res.data);
        print('Register Sucess');
        Get.to(Bottombar());

        return res.data;
      } else {
        Get.snackbar('Failed', 'Failed To Registration');
      }
    } catch (e) {
      print(e.toString());

      final snackBar = SnackBar(
          content: KText(
        text: 'Please give correct email and password ',
        color: white,
        maxLines: 5,
      ));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
