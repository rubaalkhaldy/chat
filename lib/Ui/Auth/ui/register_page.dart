import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:chat/Ui/Auth/ui/widgets/custom_dropdown_button.dart';
import 'package:chat/Ui/Auth/ui/widgets/custom_textfield.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Form(
        key: provider.registerKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Creat an account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ],
              ),

                Column(
                  
                  children: [
                    CustomTextfeild(
                      label: 'Email',
                      controller: provider.emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    CustomTextfeild(
                      label: 'Password',
                      isHidden: true,
                      controller: provider.passwordController,
                    ),
                    CustomTextfeild(
                      label: 'User Name',
                      controller: provider.userNameController,
                    ),
                    CustomDropDownButton(),
                    CustomTextfeild(
                      label: 'Country',
                      controller: provider.countryController,
                    ),
                    CustomTextfeild(
                      label: 'City',
                      controller: provider.cityController,
                    ),
                    CustomTextfeild(
                      label: 'Phone',
                      controller: provider.phoneController,
                    ),
                    CustomButton(
                        title: 'Sign Up', function: provider.registerNewUser)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
