import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_style.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String id='RegisterScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetData.loginBG),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('R E G I S T E R',style:MyStyle.textStyle20.copyWith(fontWeight:FontWeight.w900) ,),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
        ),
        body:  RegisterBody(),
      ),
    );
  }
}
