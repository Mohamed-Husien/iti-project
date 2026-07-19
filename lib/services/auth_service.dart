import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<String> createUserWithEmailAndPassword({
    required String mail,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: mail,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'Unexpected Error';
      }
    } catch (e) {
      return "oops! there was an error ";
    }
  }

  static Future<String> loginUserWithEmailAndPassword({
    required String mail,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return 'Unexpected Error';
      }
    } catch (e) {
      return "oops! there was an error ";
    }
  }

  static Future<String> logOut() async {
    try {
      await firebaseAuth.signOut();
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> deleteUser() async {
    try {
      User? currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.delete();
        return 'success';
      } else {
        return 'There is no user to delete it ';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return " you should login first";
      }
      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
