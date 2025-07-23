import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //create an instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //also creat an instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //handle user sign-up
  Future<String?> signup(
      {required String name,
      required String email,
      required String password,
      required String role}) async {
    //try to signup, if not successful, catch the error and then display it
    try {
      //create user in firestore
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

      //save the user data
      await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({'name': name.trim(), 'email': email.trim(), 'role': role});
      return null;
    } catch (e) {
      return e.toString(); //catch the error for display
    }
  }

  //function to handle user login
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    //try to login, if not successful, catch the error and then display it
    try {
      //login user in firestore
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      //fetch  the user data
      DocumentSnapshot userDoc = await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();

      return userDoc['role'];
    } catch (e) {
      return e.toString();
    }
  }

  //function to handle user sign out
  signOut() async {
    _auth.signOut();
  }

  //get user data
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;
      final doc = await _firestore.collection("users").doc(user.uid).get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }
}
