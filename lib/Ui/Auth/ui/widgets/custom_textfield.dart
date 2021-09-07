import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfeild extends StatelessWidget {
  String label;

  TextEditingController controller;

  bool isHidden;
  TextInputType textInputType;
  CustomTextfeild(
      {this.label,
      this.controller,
      this.textInputType = TextInputType.text,
      this.isHidden = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: isHidden,
          keyboardType: textInputType,
          controller: this.controller,
          validator: (v) =>
              Provider.of<AuthProvider>(context, listen: false).nullValidate(v),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                  ),
        ),
        SizedBox(
        height: 10,
      )

      ],
    );
  }
}
