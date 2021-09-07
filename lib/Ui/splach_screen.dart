import 'package:chat/Ui/Auth/providers/auth_provider.dart';
import 'package:chat/Ui/Auth/ui/auth_main_page.dart';
import 'package:chat/Ui/chat/ui/home_page.dart';
import 'package:chat/Ui/helpers/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  static final routeName = 'splachScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      bool userExisting =
          Provider.of<AuthProvider>(context, listen: false).checkUser();
      if (userExisting) {
        RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
      } else {
        RouteHelper.routeHelper.goAndReplacePage(AuthMainPage.routeName);
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: 
             // Icon(Icons.chat, color: Color(0xff0095FF),),
            

             Image.asset('assets/images/chat.png'),

            //FlutterLogo(size: 30,),
          ),
        ),
      ),
    );
  }
}
