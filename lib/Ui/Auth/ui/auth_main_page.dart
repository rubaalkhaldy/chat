import 'package:chat/Ui/Auth/ui/login_page.dart';
import 'package:chat/Ui/Auth/ui/register_page.dart';
import 'package:flutter/material.dart';

class AuthMainPage extends StatelessWidget{
    static final routeName = 'authMainPage';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'SignUp',
              ),
              Tab(
                  text: 'Login',
                ),
            ],
          ),
        ),
                  body: TabBarView(children: [RegisterPage(), LoginPage()]),

      )
      );
    
  }

}