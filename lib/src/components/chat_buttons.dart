import 'package:chat_app/src/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  ButtonWidgets({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  final String text;
  void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: Text(
        text,
        style: AppTextStyles.buttonsStyle,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(250, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}
