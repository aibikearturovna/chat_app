import 'package:chat_app/src/components/chat_buttons.dart';
import 'package:chat_app/src/components/logo_animetion.dart';
import 'package:chat_app/src/components/login_field.dart';
import 'package:chat_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AnimationLogo(),
            Column(
              children: [
                LoginField(
                    controller: controller.emailCtl,
                    hintText: 'Email',
                    labelText: 'Email'),
                const SizedBox(
                  height: 22,
                ),
                LoginField(
                    controller: controller.passwordCtl,
                    hintText: 'Password',
                    labelText: 'Password'),
              ],
            ),
            ButtonWidgets(
              text: isLogin ? 'Login' : 'Register',
              onPressed: () async => await controller.loginreg(isLogin),
              color: AppColors.carnation,
            ),
          ],
        ),
      ),
    ));
  }
}
