import 'package:diversify/common/constants/constants.dart';
import 'package:diversify/features/auth/controllers/auth_controller.dart';
import 'package:diversify/features/auth/models/user.dart';
import 'package:diversify/features/auth/screens/login_screen.dart';
import 'package:diversify/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _countryController.dispose();
  }

  signUp(BuildContext context) {
    AuthController controller = AuthController();

    if (_passwordController.text != _confirmPasswordController.text) {
      showSnackBar(context, "Password is not the same as Confirm Password");
    } else {
      UserModel myModel = UserModel(
        country: _countryController.text,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        uid: "",
      );

      controller.signUp(myModel, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14, top: 10),
                        child: Image(
                          image: AssetImage('assets/images/tree_img.png'),
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Let\'s Sign Up!',
                            style: GoogleFonts.poppins(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          Text(
                            'Let\'s explore new cultures!',
                            style: GoogleFonts.roboto(
                              color: Colors.purple,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    // color: Colors.lime[100],
                    margin: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: 650,
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hintText: 'Enter your name',
                            isObscure: false,
                            controller: _nameController,
                          ),
                          MyTextField(
                            hintText: 'Enter your age',
                            isObscure: false,
                            controller: _ageController,
                          ),
                          MyTextField(
                            hintText: 'Enter your country',
                            isObscure: false,
                            controller: _countryController,
                          ),
                          MyTextField(
                            hintText: 'Enter your email address',
                            isObscure: false,
                            controller: _emailController,
                          ),
                          MyTextField(
                            hintText: 'Enter your password',
                            isObscure: true,
                            controller: _passwordController,
                          ),
                          MyTextField(
                            hintText: 'Confirm your password',
                            isObscure: true,
                            controller: _confirmPasswordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                moveScreen(context, true, LoginScreen());
                              },
                              child: Text(
                                'Not new? Log In here...',
                                style: GoogleFonts.poppins(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                signUp(context);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.center,
                                child: Text(
                                  'Begin the New Journey!',
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
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
