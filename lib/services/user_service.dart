import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //method to store the username and emaail in shared pref

  static Future <void> storeUserDetails ({
 required String username,
 required String email, 
 required String password, 
 required String ConfirmPassword, 
required BuildContext context}) async{
      

      
    //if the user password and con password are the same then store the user name
    try{
      // check whether the user enter password and confirm password same
      if(password != ConfirmPassword){
        //show a msg to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("password and confirm password do not match",
          ),
          ),
        );
        return;
        
      }

      //create and instance from shared preferance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      //store the username and email as key value pairs
      await prefs.setString("username", username);
      await prefs.setString("Email", email);

      //show msg for the user 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User details store succesfull"),),
      );
    } 
    catch (err) {
      err.toString();
    }
  }
} 