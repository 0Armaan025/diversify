import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/screens/festival/festival_screen.dart';
import 'package:diversify/features/screens/weekly_challenges/weekly_challenge_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPostTrigerred = false;
  bool _isFestivalsTriggered = false;
  bool _isProfileTrigerred = true;
  String country = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    var data = firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      country = snapshot.get('country');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _isProfileTrigerred = false;
                        _isFestivalsTriggered = false;
                        _isPostTrigerred = true;
                        moveScreen(context, false, const HomeScreen());
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: _isPostTrigerred == true
                              ? Colors.green[700]
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'POSTS',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        _isProfileTrigerred = true;
                        _isFestivalsTriggered = false;
                        moveScreen(context, false, FestivalsScreen());
                        _isPostTrigerred = false;
                        setState(() {});
                      },
                      child: Container(
                        width: 120,
                        height: 60,
                        decoration: BoxDecoration(
                          color: _isFestivalsTriggered == true
                              ? Colors.green[700]
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'FESTIVALS',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        _isProfileTrigerred = true;
                        _isFestivalsTriggered = false;
                        _isPostTrigerred = false;
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: _isProfileTrigerred == true
                              ? Colors.green[700]
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'PROFILE',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1510913415497-e34c432bd039?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bGV0dGVyJTIwYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Let's win this!🔥",
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4.0,
                child: Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(posterName),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                elevation: 4.0,
                child: Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(posterEmail),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                elevation: 4.0,
                child: Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(country),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "We are here to participate and go back home after winning 🔥, we all like traveling and visiting other cultures, this app shows about different places, festivals and cultures where hackers travel!",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        moveScreen(context, false, WeeklyChallengeScreen());
                      },
                      child: Text(
                        'You are awesome!\nwhy don\'t you try weekly challenges?',
                        style: GoogleFonts.roboto(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
