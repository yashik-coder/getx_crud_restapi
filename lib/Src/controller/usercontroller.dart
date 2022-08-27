import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_restapi/Src/api/api.dart';
import 'package:getx_crud_restapi/Src/screen/bottombar.dart';

import '../constants/appcolors.dart';
import '../model/users.dart';
import '../widgets/kText.dart';

class Usercontroller extends GetxController {
  final _dio = Dio();

  final page = RxInt(1);
  //per page data show number
  final perPage = RxInt(5);
  final user = RxList<User>();
  final isEmpty = RxBool(true);
  final isLoading = RxBool(false);
  final isUpdate = RxBool(false);

  final scrollController = ScrollController();

  //

  // user model
  final email = RxString('');
  final firstName = RxString('');
  final lastName = RxString('');
  //

  getalluserdata(BuildContext context) async {
    try {
      if (user.isEmpty) {
        final response = await _dio
            .get('$baseurl/users?per_page=$perPage&page=${page.value}');

        final List<User> userData = response.data['data']
            .map((json) => User.fromJson(json))
            .toList()
            .cast<User>();

        if (response.statusCode == 200) {
          user.addAll(userData);
        }
      }
    } catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: e.toString(),
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  void loadMoreUserData() async {
    try {
      if (isEmpty.value == true) {
        isLoading.value = true;
        page.value++;
        final response = await _dio
            .get('$baseurl/users?per_page=$perPage&page=${page.value}');

        final List<User> userData = response.data['data']
            .map((json) => User.fromJson(json))
            .toList()
            .cast<User>();
        if (userData.length > 0) {
          user.addAll(userData);
          isLoading.value = false;
          scrollController.animateTo(
            scrollController.offset + 750,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          print('---No More Data---');
          Get.defaultDialog(
              title: 'Nothing',
              content: KText(
                text: 'There is no data',
                color: black,
              ));
          isLoading.value = false;
          isEmpty.value = false;
        }
      }
    } catch (e) {
      print(e);
      // final snackbar = SnackBar(
      //   backgroundColor: Colors.red,
      //   content: KText(
      //     text: e.toString(),
      //     color: Colors.white,
      //     maxLines: 5,
      //   ),
      // );
      // return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  deleteSingleUserData(BuildContext context, {required int id}) async {
    try {
      final res = await _dio.delete(
        '$baseurl/users/$id',
      );

      if (res.statusCode == 204) {
        print('user deleted');
        Get.defaultDialog(
          title: 'Delete success',
          content: KText(
            text: 'user $id deleted',
            color: black,
          ),
        );
        return res.data;
      } else {
        print('failed to delete this user');
      }
    } catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: e.toString(),
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  void updateUserData({required int id}) async {
    try {
      final res = await _dio.put('$baseurl/users/$id', data: {
        'id': id,
        'email': email.value,
        'first_name': firstName.value,
        'last_name': lastName.value,
      });

      if (res.statusCode == 200) {
        Get.defaultDialog(
          title: 'Update success',
          content: KText(
            text: 'user $id updated',
            color: black,
          ),
        );

        print(res.data);

        await Future.delayed(Duration(seconds: 1));

        await Get.offAll(Bottombar());

        return res.data;
      } else {
        throw Exception('Please full fill all field');
      }
    } catch (e) {
      print(e);
    }
  }
}
