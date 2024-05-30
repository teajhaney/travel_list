
import '../Authentication/authentication_export.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//sign up user

  Future<String> signUpUser(
      {required String firstName,
      required String lastName,
	  required String userName,
      required String email,
	  
      required String password}) async {
    String response = "Some error Occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          lastName.isNotEmpty ||
          firstName.isNotEmpty|| userName.isNotEmpty) {
        UserCredential credential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        model.User user = model.User(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          uid: credential.user!.uid, userName: userName,
        );

        //adding user info

        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        response = "success";
      } else {
        response = 'Please enter all the fields';
      }
    } catch (error) {
      error.toString();
    }
    return response;
  }


//Signin user
  Future<String> signInUser(
      {required String email, required String password}) async {
    String response = "Some error Occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        response = "success";
      } else {
        response = "Please enter all the fields";
      }
    } catch (error) {
      error.toString();
    }
    return response;
  }

  // reset password
  Future<String> resetPassword({required String email}) async {
	String response = "Some error Occurred";
	try {
	  if (email.isNotEmpty) {
		await _firebaseAuth.sendPasswordResetEmail(email: email);
		response = "success";
	  } else {
		response = "Please enter all the fields";
	  }
	} catch (error) {
	  error.toString();
	}
	return response;
  }


//Log out user
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }
}
