import 'package:expenz_app/screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: OnboardScreen()

    );
  }
}