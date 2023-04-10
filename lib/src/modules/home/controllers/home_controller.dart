import 'package:chat_app/src/modules/login/service/home_service.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:chat_app/src/utils/alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final textCTl = TextEditingController();

  Future<void> signOut() async {
    AppDialog.showDialog();
    await HomeService.signOut();
    await Get.offAllNamed(Routes.CHAT);
  }

  Future<void> delete() async {
    await HomeService.delete();
    await Get.offAllNamed(Routes.CHAT);
  }

  Future<void> sendMessages() async {
    final sms = textCTl.text.trim();
    textCTl.text = '';
    if (sms != '') {
      await HomeService.sendMessages(sms);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    return HomeService.streamMessage();
  }
}
