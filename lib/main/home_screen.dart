import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/common/widgets/post_widget.dart';
import 'package:diversify/features/screens/festival/chat/chat_screen.dart';
import 'package:diversify/features/screens/posts/add_post_screen.dart';
import 'package:diversify/features/screens/festival/festival_screen.dart';
import 'package:diversify/main/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPostTrigerred = true;
  bool _isFestivalsTriggered = false;
  bool _isProfileTrigerred = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isPostTrigerred == true
        ? Scaffold(
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
                              _isProfileTrigerred = false;
                              _isFestivalsTriggered = true;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello there, $posterName.",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              moveScreen(context, false, AddPostScreen());
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        moveScreen(context, true, ChatScreen());
                      },
                      child: Container(
                          width: 220,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Connect with community!",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('posts')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Column(
                                children: snapshot.data!.docs.map((document) {
                              return PostWidget(
                                countryName: document['countryName'],
                                description: document['description'],
                                email: document['posterEmail'],
                                userName: document['posterName'],
                                image: document['image'],
                                festivalName: document['festivalName'],
                              );
                            }).toList());
                          }
                        }),
                  ],
                ),
              ),
            ),
          )
        : FestivalsScreen();
  }
}
