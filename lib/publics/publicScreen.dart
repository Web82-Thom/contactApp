import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/services/user_service.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';
import '../screens/password_screen.dart';
import '../screens/term_screen.dart';

import '../models/user_model.dart';

class PublicScreen extends StatefulWidget {
  @override
  _PublicScreenState createState() => _PublicScreenState();
}

class _PublicScreenState extends State<PublicScreen> {
  UserService _userService = UserService();

  List<Widget> _widget = [];
  int _indexSelected = 0;

  String _email;

  @override
  void initState() {
    super.initState();

    _widget.addAll([
      AuthScreen(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }),
      ),
      TermScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index)),
      PasswordScreen(
        onChangedStep: (index, value) => setState(
          () {
            if (index != null) {
              _indexSelected = index;
            }

            if (value != null) {
              _userService.auth(UserModel(
                email: _email,
                password: value,
              )).then(
                (value) {
                  if(value.uid != null) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: _widget.elementAt(_indexSelected),
      ),
    );
  }
}
