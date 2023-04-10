import 'package:chat_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage(
    this.textCTl, {
    super.key,
    this.onPressed,
  });

  final TextEditingController textCTl;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.purple,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: textCTl,
              decoration: const InputDecoration(
                hintText: 'Message',
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.send,
            ),
          ),
        ],
      ),
    );
  }
}
