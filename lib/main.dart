import 'package:flutter/material.dart';

import '../publics/publicScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thom\'chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PublicScreen(),
    );
  }
}
