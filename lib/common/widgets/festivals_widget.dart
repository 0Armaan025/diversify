import 'package:diversify/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FestivalWidget extends StatelessWidget {
  const FestivalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.lightGreen[200],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                image: NetworkImage(
                    'https://placeholder.com/assets/images/150x150-2-500x500.png'),
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
                "Roshni ka mela",
                style: GoogleFonts.roboto(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                "Going on...",
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
            width: size.width * 0.08,
          ),
          ElevatedButton(
            onPressed: () {},
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
