import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginsignupcontroller.dart';
import 'usercontroller.dart';

class Basecontroller {
  final loginsignupc = Get.put(LoginSignupController());
  final userlistc = Get.put(Usercontroller());
}
