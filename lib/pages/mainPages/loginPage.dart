// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_firebase/pages/Services/auth_service.dart';
import '../widgets/customTextBox.dart';
import '../widgets/signinButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));
//try to sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);

      showError(e.code);
    }
  }

  void showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.yellow,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //LOGO
                Image.asset(
                  'lib/assets/android.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 50,
                ),

                // Text

                Text(
                  'HELLO',
                  style: GoogleFonts.bebasNeue(fontSize: 50),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'Welcome again you\'ve been missed.',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(
                  height: 40,
                ),
                /*-----------------------------------TextFields-------------------------------*/
                MyTextBox(
                  myController: emailController,
                  myText: 'Enter your email',
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextBox(
                  myController: passwordController,
                  obsecureText: true,
                  myText: 'Enter your password',
                ),
                /*----------------------------------------------------------------------------*/
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: signIn,
                ),

                const SizedBox(
                  height: 15,
                ),

                //continue with google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or continue with',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          AuthService().singnWithGoogle();
                        },
                        icon: Image.asset(
                          'lib/assets/google.png',
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'lib/assets/facebook.png',
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register now',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red.shade500,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
