import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

// SignUp
  Future<User?> signUpDSP(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Some error occured");

      if (e.code == "email-already-in-use") {
        print("The email address is already in use.");
      } else {
        print("An error occured: ${e.code}");
      }
    }
    return null;
  }

  // SignIn
  Future<User?> signInDSP(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Some error occured");

      if (e.code == "user-not-found" || e.code == "wrong-password") {
        print("Invalid email or password.");
      } else {
        print("An error occured: ${e.code}");
      }
    }
    return null;
  }
}
