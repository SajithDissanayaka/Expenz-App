import 'package:expenz_app/screen/onboard_screen.dart';
import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/widget/wrapper.dart';
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
    return FutureBuilder(
      future: UserService.checkUserName(),
      builder: (context, snapshot) {

        //if the anapshot is still waiting
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator(); // loading icon
        }else{ 
          //here the hashUserName will be set to true if the data is there the snapshor and otherwise false
          bool hashUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Inter",

            ),
            home: Wrapper(
              showMainScreen: hashUserName),
          );
        }
      },
    );
  }
}