import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo2/features/auth_features/data/models/user_model/user_Model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  userRegister() {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((val) {
      print(val.user!.uid);
      print(val.user!.email);
      val.user?.sendEmailVerification();
      createFireStoreAccounts(uId: val.user!.uid);
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        String errorMessage;
        switch (error.code) {
          case 'email-already-in-use':
            errorMessage = 'The email address is already in use by another account.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is badly formatted.';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Operation not allowed. Please enable email/password sign-in in the Firebase Console.';
            break;
          case 'weak-password':
            errorMessage = 'The password provided is too weak.';
            break;
          default:
            errorMessage = 'An undefined Error happened.';
        }
        print(errorMessage);
        emit(RegisterFailuer(e: errorMessage));
      } else {
        print(error.toString());
        emit(RegisterFailuer(e: error.toString()));
      }
    });
  }

  
  createFireStoreAccounts({required String uId})
  {
    UserModel userModel=UserModel(name: nameController.text, email: emailController.text, phone: phoneController.text, uId: uId);
    FirebaseFirestore.instance.collection("Users").doc().set(userModel.toMap()).then((val){
      emit(RegisterSuccess());
    }).catchError((e){
      print(e.toString());
      emit(RegisterFailuer(e: e));
    });
  }
  
  onPressed()
  {
    if(formState.currentState!.validate())
    {
      userRegister();
    }
    else
    {
      autovalidateMode=AutovalidateMode.onUserInteraction;
      emit(RegisterValidation());
    }
  }

}
