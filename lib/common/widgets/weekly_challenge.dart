// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diversify/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyChallengeWidget extends StatefulWidget {
  final String title;
  final String description;
  const WeeklyChallengeWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<WeeklyChallengeWidget> createState() => _WeeklyChallengeWidgetState();
}

class _WeeklyChallengeWidgetState extends State<WeeklyChallengeWidget> {
  bool isYes = true;
  bool isNo = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: Container(
        width: double.infinity,
        height: size.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.lightGreen[200],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 300,
              child: Text(
                widget.description,
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showSnackBar(context,
                        'You have successfully selected a challenge of ${widget.title}');
                  },
                  child: Chip(
                    backgroundColor:
                        isYes == true ? Colors.red[800] : Colors.red[300],
                    label: Text(
                      'Accept',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Chip(
                    backgroundColor:
                        isNo == true ? Colors.red[800] : Colors.red[300],
                    label: Text(
                      'Decline',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
