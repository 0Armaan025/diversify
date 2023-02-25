import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/auth/screens/login_screen.dart';
import 'package:diversify/main/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = firebaseAuth.currentUser?.uid ?? '';
    getData();
  }

  getData() async {
    var data = firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      posterName = snapshot.get('name');
      posterEmail = snapshot.get('email');
      setState(() {
        print(posterName);
        print(posterEmail);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Let\'s enjoy\nmore cultures\nand meet with new people.',
                      style: GoogleFonts.poppins(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/culture_asset.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      moveScreen(
                          context,
                          true,
                          firebaseAuth.currentUser == null
                              ? LoginScreen()
                              : HomeScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Let\'s start',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.green,
                            Colors.lightGreen,
                            Colors.lightGreenAccent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
