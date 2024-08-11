import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/auth_features/presentation/views/login.dart';
import '../../../../core/widgets/custom_tff.dart';
import 'custom_elvated_bottom.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    super.key,
  });


  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            const Text('Create Account!',style: MyStyle.textStyle24,),
            const SizedBox(height: 40,),
            CustomTff(textEditingController:name , obSecureText: false, borderColor: blackColor,label: 'FristName',),
            const SizedBox(height: 40,),
            CustomTff(textEditingController:email , obSecureText: false, borderColor: blackColor,label: 'E-Mail',keyboardType: TextInputType.emailAddress,),
            const SizedBox(height: 40,),
            CustomTff(textEditingController:phone , obSecureText: false, borderColor: blackColor,label: 'Phone',keyboardType: TextInputType.phone),
            const SizedBox(height: 40,),
            CustomTff(textEditingController:password , obSecureText: true, borderColor: blackColor,label: 'Password',keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 40,),
            CustomElevated(text: 'R E G I S T E R', onPressed: () { Navigator.pushReplacementNamed(context, LoginScreen.id); },),
            const SizedBox(height: 40,),
      
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                child: const Text('Did You Have An Account !')),
          ],
        ),
      ),
    );
  }
}

