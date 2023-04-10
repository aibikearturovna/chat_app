import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppDialog {
  static void showDialog() {
    Get.defaultDialog(content: const CupertinoActivityIndicator());
  }

  static Future<void> showAlert(String content, String? title) async {
    await Get.defaultDialog(
      title: title ?? 'wait',
      content: Text(content),
    );
  }
}
