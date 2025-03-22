import 'package:books_store/core/assets/assets.dart';
import 'package:books_store/core/router/app_router.dart';
import 'package:books_store/features/splash/views/widgets/slide_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBady extends StatefulWidget {
  const SplashViewBady({super.key});

  @override
  State<SplashViewBady> createState() => _SplashViewBadyState();
}

class _SplashViewBadyState extends State<SplashViewBady>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideanimation;
  @override
  void initState() {
    super.initState();
    initSlideanimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        const SizedBox(height: 17),
        SlideText(slideanimation: slideanimation),
      ],
    );
  }

  void initSlideanimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slideanimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(AppRouter.khomeView);
    });
  }
}
