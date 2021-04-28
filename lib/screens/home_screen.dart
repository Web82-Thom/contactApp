import 'package:contact_app/publics/publicScreen.dart';
import 'package:contact_app/services/user_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: TextButton(
          child: Text('logout'),
          onPressed: () async {
            await _userService.logout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PublicScreen(),), (route) => false,);
          },
        ),),
      ),
      
    );
  }
}