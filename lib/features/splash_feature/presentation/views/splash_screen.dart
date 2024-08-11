import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo2/core/utils/my_color.dart';

import '../widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String id='SplashScreen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: scaffoldColor
        ),
      ),
      body: const SplashBody(),
    );
  }
}


