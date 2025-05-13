
import 'package:express_ease/controllers/auth_controller/auth_controller.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:express_ease/res/images/images.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),()=> widget.controller.chekSession());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 91),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                logo1,
                height: getHeight(101),
                width: getWidth(251),
              ),
              const SizedBox(
                height: 289.63,
              ),
              Text(
                // strutStyle:const StrutStyle(height: 16,forceStrutHeight: true),
                'Let’s move something better',
                style: buttonText2.copyWith(color: korange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
