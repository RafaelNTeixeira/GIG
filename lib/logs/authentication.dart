import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  
  Future signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
