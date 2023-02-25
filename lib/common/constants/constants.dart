//moveScreen
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

moveScreen(BuildContext context, bool isPushReplacement, Widget toScreen) {
  if (isPushReplacement) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => toScreen));
  } else {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => toScreen));
  }
}

File? pickedFile;

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen[600],
    title: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tree_img.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Diversify!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    ),
    centerTitle: true,
  );
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

//some firebase constants

final firestore = FirebaseFirestore.instance;
final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;

//some other vars

String uid = "";
