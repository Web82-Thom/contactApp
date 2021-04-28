import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../publics/publicScreen.dart';
import '../services/user_service.dart';
import '../screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thom\'chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active) {
            if(snapshot.hasData){
              return HomeScreen();
            }
            return PublicScreen();
          }
          return SafeArea(
            child: Scaffold( 
              body: Center(child: CircularProgressIndicator(), ),
            ),
          );
        },
      )
    );
  }
}
