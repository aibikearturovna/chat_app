import 'package:chat_app/src/message/send_message.dart';
import 'package:chat_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../message/stream_message.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lilac,
        title: const Text('Sun&Moon'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async => await controller.signOut(),
                value: 'Logout',
                child: const Text('Logout'),
              ),
              PopupMenuItem(
                onTap: () async => await controller.delete(),
                value: 'Delete',
                child: const Text('Delete'),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          // Card(
          //   child:
          //       Text(DateFormat('dd/MM/yy (hh:mm)').format()),
          // ),
          StreamMessage(
            controller.streamMessage(),
          ),
          SendMessage(
            controller.textCTl,
            onPressed: () async => controller.sendMessages(),
          ),
        ],
      ),
    );
  }
}
