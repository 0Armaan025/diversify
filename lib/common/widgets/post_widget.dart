import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: size.height * 0.43,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.lightGreen[600],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          "Armaan",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          "armaan33000@gmail.com",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.red,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.35,
                  padding: const EdgeInsets.all(8),
                  height: size.height * 0.24,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Cillum laboris reprehenderit labore in deserunt aliqua veniam laborum sint amet exercitation sit. Aute est nostrud consectetur...",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text('India'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
