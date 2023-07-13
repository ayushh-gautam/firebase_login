import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/pages/widgets/customTextBox.dart';
import 'package:login_firebase/pages/widgets/signinButton.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();

  void signUp() async {
    if (passController.text != cPassController.text) {
      return;
    }
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text, password: passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextBox(
                  obsecureText: false,
                  myController: nameController,
                  myText: 'email'),
              const SizedBox(
                height: 20,
              ),
              MyTextBox(
                obsecureText: true,
                myController: passController,
                myText: 'password',
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextBox(
                obsecureText: true,
                myController: cPassController,
                myText: 'confirm passeord',
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                text: 'Sign Up',
                onTap: signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
