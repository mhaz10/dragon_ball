import 'package:dragon_ball/core/utils/app_router.dart';
import 'package:dragon_ball/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomImage(image: 'assets/images/dragon_ball_logo (1).png', height: 240,),
        CustomImage(image: 'assets/images/dragon_ball_logo (2).png', height: 240,),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () => GoRouter.of(context).pushReplacement(AppRouter.kHomeView));
  }
}

