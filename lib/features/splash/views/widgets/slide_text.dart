import 'package:flutter/material.dart';

class SlideText extends StatelessWidget {
  const SlideText({super.key, required this.slideanimation});

  final Animation<Offset> slideanimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideanimation,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slideanimation,
          child: const Text(
            'Read Free Books',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
