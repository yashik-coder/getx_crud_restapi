import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_restapi/Src/controller/basecontroller.dart';
import 'package:getx_crud_restapi/Src/widgets/kText.dart';
import 'package:getx_crud_restapi/Src/widgets/ktextformfield.dart';

import '../constants/appcolors.dart';

class Signupscreen extends StatelessWidget with Basecontroller {
  Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              KText(
                color: blueGrey,
                text: 'Sign Up Screen',
                fontSize: 40,
                fontFamily: medium,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: KTextFormField(
                    hintText: 'E-mail',
                    obscure: false,
                    color: blueGrey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter a email';
                      }
                      return '';
                    },
                    onchanged: loginsignupc.email),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  onChanged: loginsignupc.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter a password';
                    }
                    return '';
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    focusedErrorBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: red)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blueGrey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blueGrey)),
                    errorBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: red)),
                  ),
                ),
              ),
              sizebox20,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate() ||
                        loginsignupc.email.value.isNotEmpty ||
                        loginsignupc.password.value.isNotEmpty) {
                      loginsignupc.register(context);
                      print('value is passing');
                    }
                  },
                  child: Container(
                    height: 50,
                    color: blueGrey,
                    width: Get.width,
                    child: Center(
                      child: KText(
                        text: 'Sign Up',
                        color: white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
