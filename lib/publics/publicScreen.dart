import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';
import '../screens/password_screen.dart';
import '../screens/term_screen.dart';

class PublicScreen extends StatefulWidget {
  @override
  _PublicScreenState createState() => _PublicScreenState();
}

class _PublicScreenState extends State<PublicScreen> {
  List<Widget> _widget = [];
  int _indexSelected = 0;


  @override
  void initState() {
    super.initState();

    _widget.addAll(
      [
      AuthScreen(onChangedStep: (index) => setState (() => _indexSelected = index)),
      TermScreen(onChangedStep: (index) => setState (() => _indexSelected = index)),
      PasswordScreen(onChangedStep: (index) => setState (() => _indexSelected = index)),
      ]
    );
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