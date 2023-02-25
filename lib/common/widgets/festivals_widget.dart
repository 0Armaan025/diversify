import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/screens/festival/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FestivalWidget extends StatefulWidget {
  final String festivalName;
  final String image;
  final String goingOn;
  const FestivalWidget(
      {super.key,
      required this.festivalName,
      required this.image,
      required this.goingOn});

  @override
  State<FestivalWidget> createState() => _FestivalWidgetState();
}

class _FestivalWidgetState extends State<FestivalWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.lightGreen[200],
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${widget.image}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.festivalName,
                style: GoogleFonts.roboto(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                widget.goingOn,
                style: GoogleFonts.roboto(
                  color: Colors.red[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.12,
          ),
          ElevatedButton(
            onPressed: () {
              moveScreen(context, false, ChatScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[500],
              elevation: 6.0,
            ),
            child: Text("Explore"),
          ),
        ],
      ),
    );
  }
}
