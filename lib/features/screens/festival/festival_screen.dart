import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/common/widgets/festivals_widget.dart';
import 'package:diversify/features/screens/festival/add_festival_screen.dart';
import 'package:diversify/main/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FestivalsScreen extends StatefulWidget {
  const FestivalsScreen({super.key});

  @override
  State<FestivalsScreen> createState() => _FestivalsScreenState();
}

class _FestivalsScreenState extends State<FestivalsScreen> {
  bool _isPostTrigerred = false;
  bool _isFestivalsTriggered = true;
  bool _isProfileTrigerred = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          moveScreen(context, false, AddFestivalScreen());
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Festivals",
                  style: GoogleFonts.poppins(
                    color: Colors.green[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
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
                        moveScreen(context, false, HomeScreen());
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('festivals')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                          children: snapshot.data!.docs.map((document) {
                        return FestivalWidget(
                          image: document['image'],
                          festivalName: document['festivalName'],
                          goingOn: document['isGoingOn'],
                        );
                      }).toList());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
