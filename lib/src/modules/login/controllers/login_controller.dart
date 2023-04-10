import 'package:chat_app/src/modules/login/service/login_service.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:chat_app/src/service/user_manage.dart';
import 'package:chat_app/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:developer';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  final count = 0.obs;

  Future<void> loginreg(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(emailCtl.text) &&
        GetUtils.isPassport(passwordCtl.text)) {
      AppDialog.showDialog();
      final user = isLogin
          ? await LoginSrv.login(emailCtl.text, passwordCtl.text)
          : await LoginSrv.register(emailCtl.text, passwordCtl.text);
      Get.back();
      if (user != null) {
        await userMan.setUid(user.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      } else {
        // log('Error');
        AppDialog.showAlert(
          isLogin ? 'wrong email or password' : 'please register again',
          'error',
        );
      }
    } else {
      log('Error');
    }
  }
}
