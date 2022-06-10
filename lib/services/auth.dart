import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:where_to_go/services/user_details.dart';

import '../models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User? user) {
    return UserModel(uid: user!.uid);
  }

  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future createUser({
    required String name,
    required String email,
    required String description,
    required String number,
    required String referenceContact,
    required String location,
    required String type,
    required String urlAadhar,
    required String urlPic,
    required String urlCertificate,
    required String urlDischargeSummeryCertificate,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    final userDetails = UserDetails(
      id: docUser.id,
      name: name,
      email: email,
      description: description,
      number: number,
      referenceContact: referenceContact,
      location: location,
      type: type,
      urlAadhar: urlAadhar,
      urlCertificate: urlCertificate,
      urlDischargeSummeryCertificate: urlDischargeSummeryCertificate,
      urlPic: urlPic,
    );
    await docUser.set(userDetails.toJson());
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
