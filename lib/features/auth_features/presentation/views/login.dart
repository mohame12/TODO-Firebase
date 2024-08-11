import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo2/core/utils/my_assets.dart';
import 'package:todo2/core/utils/my_style.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String id='Login_Screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetData.loginBG),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('L O G I N',style:MyStyle.textStyle20.copyWith(fontWeight:FontWeight.w900) ,),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          ),
        ),
        body:  LoginBody(),
      ),
    );
  }
}


