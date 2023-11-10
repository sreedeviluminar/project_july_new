import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Returns the current User if they are currently signed-in, or null if not.
  get user => auth.currentUser;

  //register user
  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // return null if registration is success
    } on FirebaseAuthException catch (e) {
      return e
          .message; // return error message if user registration is not success
    }
  }

//Login user
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // return null if login is success
    } on FirebaseAuthException catch (e) {
      return e.message; // return error message if user login is not success
    }
  }

  //Logout user
  Future<void> logOut() async {
    await auth.signOut();
  }
}
