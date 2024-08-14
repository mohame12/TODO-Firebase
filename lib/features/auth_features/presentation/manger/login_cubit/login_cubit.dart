import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  userLogin() {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((val) {
      print(val.user!.uid);
      print(val.user!.email);
      if (val.user?.emailVerified == true) {
        emit(LoginSuccess(uId: val.user!.uid));
      } else {
        emit(LoginFailuer(e: "Please check your email and verify it."));
      }
    }).catchError((e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        case 'user-disabled':
          errorMessage = 'User account has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many attempts. Try again later.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password sign-in is disabled.';
          break;
        default:
          errorMessage = 'An undefined error occurred: ${e.message}';
      }

      emit(LoginFailuer(e: errorMessage));
    });
  }



  onPressed()
  {
    if(formkey.currentState!.validate())
    {
      userLogin();
    }
    else
    {
      autovalidateMode=AutovalidateMode.onUserInteraction;
      emit(LoginVaildate());
    }
  }
}
