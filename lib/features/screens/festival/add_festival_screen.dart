import 'dart:developer';
import 'dart:io';

import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/common/widgets/text_field.dart';
import 'package:diversify/features/auth/controllers/auth_controller.dart';
import 'package:diversify/features/auth/models/post.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddFestivalScreen extends StatefulWidget {
  const AddFestivalScreen({super.key});

  @override
  State<AddFestivalScreen> createState() => _AddFestivalScreen();
}

class _AddFestivalScreen extends State<AddFestivalScreen> {
  final _festivalNameController = TextEditingController();
  final _startingController = TextEditingController();
  File? myFile = null;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _festivalNameController.dispose();
    _startingController.dispose();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    myFile = File(image!.path);
    pickedFile = myFile;
    setState(() {});
  }

  addFestival(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                  "Let's add a festival!",
                  style: GoogleFonts.poppins(
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: size.height * 0.3,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: myFile == null
                    ? IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {
                          pickImage();
                        },
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(myFile!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hintText: 'Enter the Festival Name.',
                  isObscure: false,
                  controller: _festivalNameController),
              MyTextField(
                  hintText: 'When did it start?',
                  isObscure: false,
                  controller: _startingController),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: Text(
                  "Is it going on?",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent[200],
                      child: Icon(
                        Icons.done,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent[200],
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Text(
                      "Add something new to explore!",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
