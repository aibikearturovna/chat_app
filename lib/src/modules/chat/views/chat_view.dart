import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/src/constants/colors.dart';
import 'package:chat_app/src/constants/text_styles.dart';
import 'package:chat_app/src/components/chat_buttons.dart';
import 'package:chat_app/src/components/logo_animetion.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimationLogo(),
              DefaultTextStyle(
                style: AppTextStyles.chatStyle,
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Flash Chat'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidgets(
            onPressed: () async => Get.toNamed(Routes.LOGIN, arguments: true),
            text: 'Login',
            color: AppColors.carnation,
          ),
          const SizedBox(
            height: 22,
          ),
          ButtonWidgets(
            onPressed: () async => Get.toNamed(Routes.LOGIN, arguments: false),
            text: 'Register',
            color: AppColors.purple,
          ),
        ],
      ),
    );
  }
}
