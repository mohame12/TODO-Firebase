import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/auth_features/presentation/manger/register_Cubit/register_cubit.dart';
import 'package:todo2/features/auth_features/presentation/views/login.dart';
import '../../../../core/utils/validation_functions.dart';
import '../../../../core/widgets/alart_dilog.dart';
import '../../../../core/widgets/custom_tff.dart';
import 'custom_elvated_bottom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (BuildContext context, RegisterState state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                content: Text(AppLocalizations.of(context)!.signupSussecc),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          } else if (state is RegisterFailuer) {
            showErrorDialog(context, state.e.toString());
          }
        },
        builder: (context, state) {
          var register = BlocProvider.of<RegisterCubit>(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Form(
                key: register.formState,
                autovalidateMode: register.autovalidateMode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                     Text(
                      AppLocalizations.of(context)!.createNewAccount,
                      style: MyStyle.textStyle24,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTff(
                      validator: (val) {
                        if (val?.trim().isEmpty == true) {
                          return "Enter Valid name";
                        }
                        return null;
                      },
                      textEditingController: register.nameController,
                      obSecureText: false,
                      borderColor: blackColor,
                      label: AppLocalizations.of(context)!.fristName,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTff(
                      validator: validateEmail,
                      textEditingController: register.emailController,
                      obSecureText: false,
                      borderColor: blackColor,
                      label: AppLocalizations.of(context)!.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTff(
                        validator: validatePhone,
                        textEditingController: register.phoneController,
                        obSecureText: false,
                        borderColor: blackColor,
                        label: AppLocalizations.of(context)!.phone,
                        keyboardType: TextInputType.phone),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTff(
                        validator: validatePassword,
                        textEditingController: register.passwordController,
                        obSecureText: true,
                        borderColor: blackColor,
                        label: AppLocalizations.of(context)!.password,
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTff(
                        validator: (value) => validateRePassword(
                            value, register.passwordController.text),
                        textEditingController: register.repasswordController,
                        obSecureText: true,
                        borderColor: blackColor,
                        label: AppLocalizations.of(context)!.rePassword,
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomElevated(
                      onPressed: () {
                       register.onPressed();
                      }, child:state is RegisterLoading?Center(child:  JumpingDotsProgressIndicator(color: Colors.white,fontSize: 15,)): Row(
                      children: [
                        Text(AppLocalizations.of(context)!.signIn,style: MyStyle.textStyle14.copyWith(color: whiteColor),),
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
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.id);
                        },
                        child:  Text(AppLocalizations.of(context)!.didYouHaveAccount)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
