import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/auth_features/presentation/manger/login_cubit/login_cubit.dart';
import 'package:todo2/features/auth_features/presentation/views/register.dart';
import 'package:todo2/features/home_feature/presentation/views/home_screen.dart';
import '../../../../core/shared_pref/shared_pref.dart';
import '../../../../core/utils/validation_functions.dart';
import '../../../../core/widgets/alart_dilog.dart';
import '../../../../core/widgets/custom_tff.dart';
import 'custom_elvated_bottom.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccess)
            {
              UserDataFromStorage.setUserIsLogin(true);
              UserDataFromStorage.setUserId(state.uId);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login successful!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(route) => false,);
            }else if (state is LoginFailuer) {
            showErrorDialog(context, state.e.toString());
          }
        },
        builder: (context, state) {
          var login=BlocProvider.of<LoginCubit>(context);
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Form(
              autovalidateMode: login.autovalidateMode,
              key: login.formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome back!',
                    style: MyStyle.textStyle24,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTff(
                    validator: validateEmail,
                    textEditingController: login.emailController,
                    obSecureText: false,
                    borderColor: blackColor,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTff(
                    validator: validatePassword,
                    textEditingController: login.passwordController,
                    obSecureText: true,
                    borderColor: blackColor,
                    label: 'Password',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Forgot password?',
                    style: MyStyle.textStyle12,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomElevated(

                    onPressed: () {
                      login.onPressed();// Navigator.pushReplacementNamed(context, HomeScreen.id);
                    }, child: state is LoginLoading? Center(child: JumpingDotsProgressIndicator(color: Colors.white,fontSize: 15,)): Row(
                    children: [
                      Text('L O G I N',style: MyStyle.textStyle14.copyWith(color: whiteColor),),
                      const Spacer(),
                      const Icon(Icons.arrow_forward,color: whiteColor,)
                    ],
                  ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RegisterScreen.id,
                          (route) => true,
                        );
                      },
                      child: const Text('Or Create My Account')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
