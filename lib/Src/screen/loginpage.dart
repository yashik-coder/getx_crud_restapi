import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_restapi/Src/screen/signupscreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants/appcolors.dart';
import '../controller/basecontroller.dart';
import '../widgets/kText.dart';
import '../widgets/ktextformfield.dart';
import 'bottombar.dart';
import 'signupscreen.dart';

class LoginPage extends StatelessWidget with Basecontroller {
  final _formKey = GlobalKey<FormState>();

  final bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: padding10,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                KText(
                  text: 'Login',
                  fontSize: 40,
                  color: blueGrey,
                  fontFamily: medium,
                ),
                SizedBox(height: 50),
                KTextFormField(
                    hintText: 'E-mail',
                    obscure: false,
                    color: blueGrey,
                    onchanged: loginsignupc.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter a E-mail';
                      }
                      return '';
                    }),
                sizebox20,
                TextFormField(
                  onChanged: loginsignupc.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blueGrey)),
                    errorBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: red)),
                    focusedErrorBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: red)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blueGrey),
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter a password';
                    }
                    return '';
                  }),
                ),
                sizebox20,
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                            loginsignupc.email.isNotEmpty ||
                        loginsignupc.password.isNotEmpty) {
                      loginsignupc.login(context);
                      //Get.to(Bottombar());
                    }
                  },
                  child: Container(
                    child: Center(
                      child: KText(
                        text: 'Login',
                        fontFamily: medium,
                      ),
                    ),
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: blueGrey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                sizebox20,
                KText(
                  text: 'or create an Account ',
                  fontSize: 12,
                  fontFamily: regular,
                  color: blueGrey,
                ),
                sizebox20,
                GestureDetector(
                  onTap: () {
                    Get.to(Signupscreen());
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: KText(
                        text: 'Sign Up',
                        fontFamily: medium,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
