import 'package:flutter/material.dart';

enum Gender { male, female }

class RegisterRequest {
  String id;
  String email;
  String password;
  String userName;
  Gender gender;
  String phoneNumber;
  String city;
  String country;

  RegisterRequest(
      {
        this.id,
        @required this.city,
      @required this.country,
      @required this.email,
      @required this.gender,
      @required this.password,
      @required this.phoneNumber,
      @required this.userName});

  toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'userName': this.userName,
      'phoneNumber': this.phoneNumber,
      'gender': this.gender == Gender.male ? 'male' : 'female',
      'country': this.country,
      'city': this.city,
    };
  }
}
