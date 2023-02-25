import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/auth/models/post.dart';
import 'package:diversify/features/screens/posts/post_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatefulWidget {
  final String userName;
  final String email;
  final String description;
  final String image;
  final String countryName;
  final String festivalName;
  const PostWidget(
      {super.key,
      required this.userName,
      required this.email,
      required this.description,
      required this.image,
      required this.countryName,
      required this.festivalName});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        PostModel model = PostModel(
          posterName: widget.userName,
          posterEmail: widget.email,
          description: widget.description,
          image: widget.image,
          countryName: widget.countryName,
          festivalName: widget.festivalName,
          postSenderUid: uid,
        );

        moveScreen(
            context,
            false,
            PostInfoScreen(
              model: model,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10,
        ),
        child: Container(
          height: size.height * 0.48,
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
                            'https://images.unsplash.com/photo-1510913415497-e34c432bd039?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bGV0dGVyJTIwYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Text(
                            "${widget.userName}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Text(
                            widget.email,
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
                          image: NetworkImage(widget.image),
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
                      widget.description,
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
                    backgroundColor: Colors.green[100],
                    elevation: 1.2,
                    label: Text(
                      widget.countryName,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Chip(
                    backgroundColor: Colors.greenAccent[600],
                    elevation: 1.2,
                    label: Text(
                      widget.festivalName,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[200],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "View More...",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
