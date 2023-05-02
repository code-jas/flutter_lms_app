import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign In
  Future<UserCredential?> signInWithGoogle() async {
    //begin interaction with google sign in
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //finally, use the credential to sign in the user
    try {
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
