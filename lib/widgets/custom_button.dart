import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;
  CustomButton({
    @required this.title,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        color: Color(0xff0095FF),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(this.title, style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
),
        onPressed: () => function(),
      ),
    );
  }
}
