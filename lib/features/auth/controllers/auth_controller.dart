import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/auth/models/post.dart';
import 'package:diversify/features/auth/models/user.dart';
import 'package:diversify/features/screens/home_screen.dart';
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
        moveScreen(context, true, HomeScreen());
      });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }

  void post(BuildContext context, PostModel post) async {
    try {
      final ref = firebaseStorage.ref().child('posts').child("/$uid.jpg");
      final uploadTask = ref.putFile(pickedFile!);

      var dowurl = await ref.getDownloadURL();
      PostModel newModel = PostModel(
          posterEmail: posterEmail,
          posterName: posterName,
          countryName: post.countryName,
          description: post.description,
          festivalName: post.festivalName,
          image: dowurl,
          postSenderUid: uid);

      firestore
          .collection('posts')
          .doc('${post.festivalName}+${post.countryName}')
          .set(newModel.toMap())
          .then(
        (value) {
          moveScreen(context, false, const HomeScreen());
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
