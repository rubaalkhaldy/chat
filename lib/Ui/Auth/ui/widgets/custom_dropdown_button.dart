import 'package:chat/Ui/Auth/Model/register_request.dart';
import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Gender',
          textAlign: TextAlign.start,
        ),
        Container(
          
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<Gender>(
              isExpanded: true,
              underline: Container(),
              value: Provider.of<AuthProvider>(context).selectedGender,
              onChanged: (e) {
                Provider.of<AuthProvider>(context, listen: false).saveGender(e);
              },
              items: Gender.values.map((e) {
                return DropdownMenuItem<Gender>(
                  value: e,
                  child: Container(
                      child: Text(e == Gender.male ? 'Male' : 'Female')),
                );
              }).toList()),
        ),
      ],
    );
  }
}
