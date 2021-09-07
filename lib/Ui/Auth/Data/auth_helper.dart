//import 'package:chat/Ui/Auth/Data/firestore_helper.dart';
import 'package:chat/Ui/Auth/Model/register_request.dart';
//import 'package:chat/Ui/helpers/custom_dialoug.dart';
import 'package:chat/Ui/helpers/route_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUp(RegisterRequest registerRequest) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: registerRequest.email, password: registerRequest.password);
      return userCredential;
    } on Exception catch (e) {
      print(e);
    }
    //  String id = userCredential.user.uid;
    //  registerRequest.id = id;

    //   await FireStoreHelper.fireStoreHelper
    //       .saveUserInFireStore(registerRequest);
    //  await verifyEmail(registerRequest.email);
    //  logout();
    //  CustomDialoug.customDialoug.showCustomDialoug(context, 'Success',
    //    'Averification Email has been sent, please verify your email before logging');
    //    } on Exception catch (e) {
    // print(e);
    // }
  }

   Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
           return userCredential;
     // if (!userCredential.user.emailVerified) {
      //  throw Exception('You have to verify your Email');
     // }
     // FireStoreHelper.fireStoreHelper
       //   .getUserFromFirestore(userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
         RouteHelper.routeHelper.showCustomDialoug('User Not Found');
      } else if (e.code == 'wrong-password') {
        RouteHelper.routeHelper.showCustomDialoug('Wrong Password');
      }
    } catch (e) {
     
    }
  }

  resetPassword(String email)  {
     firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail()  {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  logout() {
    firebaseAuth.signOut();
  }

 // User getCurrentUserId() {
 //   return firebaseAuth.currentUser;
 // }
 bool checkUser(){
   return firebaseAuth.currentUser != null;
 }
  String getUserId() {
    return firebaseAuth.currentUser.uid;
  }
}
