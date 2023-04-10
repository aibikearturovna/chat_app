import 'package:flutter/material.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    super.key,
  });

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();

    animation.addStatusListener((status) {});

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Image.asset('assets/logo.png', width: 55);
    return Hero(
      tag: 'logo',
      child: SizedBox(
        // ignore: sort_child_properties_last
        child: Image.asset('assets/logo.png'),
        height: controller.value * 80,
      ),
    );
  }
}
