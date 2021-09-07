import 'dart:io';

import 'package:chat/Ui/Auth/Data/auth_helper.dart';
import 'package:chat/Ui/Auth/Data/firestorage_helper.dart';
import 'package:chat/Ui/Auth/Data/firestore_helper.dart';
import 'package:chat/Ui/Auth/Model/register_request.dart';
import 'package:chat/Ui/Auth/Model/user_model.dart';
import 'package:chat/Ui/Auth/ui/auth_main_page.dart';
import 'package:chat/Ui/chat/ui/edit_page.dart';

import 'package:chat/Ui/chat/ui/home_page.dart';
import 'package:chat/Ui/helpers/route_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(){
    if(checkUser()){
      getUserFormFirestore(AuthHelper.authHelper.getUserId());
    }
  }
 UserModel userModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Gender selectedGender;
  saveGender(Gender gender) {
    this.selectedGender = gender;
    notifyListeners();
  }

  nullValidate(String v) {
    if (v == null || v.length == 0) {
      return 'Required Field';
    }
  }

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextStyle headingStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black87);
  TextStyle bodyStyle = TextStyle(fontSize: 15, color: Colors.blue);
  registerNewUser() async {
    if (registerKey.currentState.validate()) {
      RegisterRequest registerRequest = RegisterRequest(
          city: cityController.text,
          country: countryController.text,
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          gender: selectedGender,
          phoneNumber: phoneController.text);

      UserCredential userCredential = await signUp(registerRequest);
      registerRequest.id = userCredential.user.uid;
      setUserInFirestore(registerRequest);
     //  await verifyEmail();

      // RouteHelper.routeHelper
        //   .showCustomDialoug('please chech your email to verify your account');
    }
  }

  loginUser() async {
    UserCredential userCredential = await login();
    // if (userCredential.user.emailVerified) {
    if (true) {
      getUserFormFirestore(userCredential.user.uid);
      RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
    }// else {
     // verifyEmail();
     // RouteHelper.routeHelper.showCustomDialoug(
     //     'sorry, you cant login because your email is not verified');
   // }
  }

  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }

  updateUserImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);

    // upload image to firestorage
    String imageUrl =
        await FireStorageHelper.fireStorageHelper.uploadImage(this.file);
    userModel.imageUrl = imageUrl;
    // update image in firestore
    updateUser();
  }

  Future<UserCredential> signUp(RegisterRequest registerRequest) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.signUp(registerRequest);
    return userCredential;
  }

  Future<UserCredential> login() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .login(emailController.text, passwordController.text);
    return userCredential;
  }

  resetPassword(String email) async {
    AuthHelper.authHelper.resetPassword(email);
  }

  verifyEmail() async {
    await AuthHelper.authHelper.verifyEmail();
    logout();
  }

  logout() async {
    AuthHelper.authHelper.logout();
    RouteHelper.routeHelper.goAndReplacePage(AuthMainPage.routeName);
  }
  checkUser(){
    return AuthHelper.authHelper.checkUser();
  }

  getUserFormFirestore(String userId) async {
    this.userModel =
        await FireStoreHelper.fireStoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }

  setUserInFirestore(RegisterRequest registerRequest) async {
    print(registerRequest.toMap());
    FireStoreHelper.fireStoreHelper.saveUserInFireStore(registerRequest);
  }

  
  editProfileNavigation() {
    userNameController.text = userModel.userName;
    countryController.text = userModel.country;
    cityController.text = userModel.city;
    phoneController.text = userModel.phoneNumber;
    selectedGender = userModel.gender;
    RouteHelper.routeHelper.goToPage(EditPage.routeName);
  }

  editProfile() async {
    userModel.userName = userNameController.text;
    userModel.gender = selectedGender;
    userModel.country = countryController.text;
    userModel.city = cityController.text;
    userModel.phoneNumber = phoneController.text;

    await updateUser();
    RouteHelper.routeHelper.goBack();
  }
    updateUser() async {
    await FireStoreHelper.fireStoreHelper.updateUserFromFirestore(userModel);
    getUserFormFirestore(userModel.id);
    
  }

}