import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/auth_features/presentation/views/register.dart';
import 'package:todo2/features/home_feature/presentation/views/home_screen.dart';
import '../../../../core/widgets/custom_tff.dart';
import 'custom_elvated_bottom.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    super.key,
  });

  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          const Text('Welcome back!',style: MyStyle.textStyle24,),
          const SizedBox(height: 40,),
          CustomTff(textEditingController:email , obSecureText: false, borderColor: blackColor,label: 'Email',keyboardType: TextInputType.emailAddress,),
          const SizedBox(height: 40,),
          CustomTff(textEditingController:password , obSecureText: true, borderColor: blackColor,label: 'Password',),
          const SizedBox(height: 40,),

          const Text('Forgot password?',style: MyStyle.textStyle12,),
          const SizedBox(height: 40,),
          CustomElevated(text: 'L O G I N', onPressed: () { Navigator.pushReplacementNamed(context, HomeScreen.id); },),
          const SizedBox(height: 40,),

           GestureDetector(
               onTap: (){
                 Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.id, (route) =>true,);
               },
               child: const Text('Or Create My Account')),

        ],
      ),
    );
  }
}