import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/constance/constance.dart';
import 'package:expenz_app/screen/main_screen.dart';
import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/widget/custome_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;
  
//form key for the validation
final _formKey = GlobalKey<FormState>();

//controller for the text from field

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmpasswordController = TextEditingController();

@override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Padding(
          padding: const EdgeInsets.all(KDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter Your \nPersonal Details",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 30,
              ),

              //form import

              Form(child: Column(
                key: _formKey,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //form field for the user name
                  TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      //check wheather the user enteed a valid username
                      if(value!.isEmpty){
                        return "Please enter valid name";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: EdgeInsets.all(20), 
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // form fild for the email 
                  TextFormField(
                    controller: _emailController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter valid value";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: EdgeInsets.all(20), 
                    ),
                  ),

                    SizedBox(
                    height: 20,
                  ),

                  //text fild for password
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "please enter the valid password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: EdgeInsets.all(20), 
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // user confirm password
                  TextFormField(
                    controller: _confirmpasswordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter the same password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: EdgeInsets.all(20), 
                    ),
                  ), 

                  SizedBox(
                    height: 20,
                  ),

                  //remember me for the next time
                  Row(
                    children: [
                      Text("Remenber me next time",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kGrey,
                      ),),
                      Expanded(child: CheckboxListTile(
                        activeColor: kMainColor,
                        value: _rememberMe, onChanged: (value){
                          setState(() {
                            _rememberMe = value!;

                          }
                          );
                        },
                        ),
                      
                        ),
                       
                    ],
                  ),
                   SizedBox(
                          height: 20,
                        ),

                        //submit button
                        GestureDetector(
                          onTap: () async {
                            if(_formKey.currentState!.validate()){

                              //form is valid process data
                              String userName = _userNameController.text;
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              String ConfirmPassword = _confirmpasswordController.text;

                              //save the username and email in device storage
                              await UserService.storeUserDetails(
                                username: userName, 
                                email: email, password: password, 
                                ConfirmPassword: ConfirmPassword, 
                                context: context);

                                //navigate to the mainScreen
                                if(context.mounted) {
                                  Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return MainScreen();
                                  },
                                  ),
                                  );
                                }
                            }
                          },
                          child: CustomeButton(
                            buttonName: "Next", 
                            buttonColor: kMainColor),
                        )
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}