import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/auth/models/user.dart';
import 'package:flutter/material.dart';

class AuthController {
  //sign up stuff

  void signUp(UserModel model, BuildContext context) {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: model.email, password: model.password)
          .then((value) {
        print("The user signed up");
        uid = firebaseAuth.currentUser?.uid ?? '';
        UserModel newData = UserModel(
            name: model.name,
            uid: uid,
            email: model.email,
            password: model.password,
            country: model.country);
        firestore
            .collection('users')
            .doc(uid)
            .set(newData.toMap())
            .then((value) {
          showSnackBar(context, 'done');
        }).onError((error, stackTrace) {
          showSnackBar(
              context, 'An error has occurred while signing up $error.message');
        });
      });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }

  void logIn(String email, String password, BuildContext context) {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('done');
      });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }
}
