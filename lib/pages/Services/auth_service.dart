import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  singnWithGoogle() async {
    //interactive signin process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //check for authentication and get the details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
