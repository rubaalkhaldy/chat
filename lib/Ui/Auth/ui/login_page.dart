import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:chat/Ui/Auth/ui/widgets/custom_textfield.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Form(
        key: provider.loginKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextfeild(
                              label: 'Email',
                              controller: provider.emailController,
                              textInputType: TextInputType.emailAddress,
                            ),
                            CustomTextfeild(
                              label: 'Password',
                              controller: provider.passwordController,
                              isHidden: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                title: 'Login', function: provider.loginUser),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                                title: 'Send Verification Code Again',
                                function: provider.verifyEmail)
                          ],
                        ),
                      ),
                      SizedBox(
                              height: 10,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          Text(
                            " Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
