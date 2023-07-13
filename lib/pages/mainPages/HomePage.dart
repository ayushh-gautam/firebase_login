import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: signOut,
                icon: const Icon(
                  Icons.exit_to_app,
                ))
          ],
        ),
        body: Column(
          children: [
            // ClipOval(
            //   child: Image.network(user.photoURL!),
            // ),
            Center(
              child: Text('Succesfully logged in as: ' + user.email!), 
            ),
          ],
        ));
  }
}
