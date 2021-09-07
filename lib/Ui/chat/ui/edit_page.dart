import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:chat/Ui/Auth/ui/widgets/custom_dropdown_button.dart';
import 'package:chat/Ui/Auth/ui/widgets/custom_textfield.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  static final routeName = 'editPage';
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Form(
          key: provider.registerKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 260,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(title: 'Edit', function: provider.editProfile)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
