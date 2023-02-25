import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/common/widgets/post_widget.dart';
import 'package:diversify/main/main.dart';
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
              PostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}