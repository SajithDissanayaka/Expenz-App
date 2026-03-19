import 'dart:ffi';

import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/constance/constance.dart';
import 'package:expenz_app/services/user_service.dart';
import 'package:expenz_app/widget/income_expenz_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for store the username
  String username = "";

  @override
  void initState() {
    // get the username from the shared Preferances
    UserService.getUserdata().then((value){
      if(value["username"]!= null){
        username = value['username']!;
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: SingleChildScrollView(

      //main column
      child: Column(
        children: [

          //bg color column
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: kMainColor.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )

            ),
            child: Padding(
              padding: const EdgeInsets.all(KDefaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kMainColor,
                          border: Border.all(
                            color: kMainColor,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.asset("expenz_app/assets/images/user.jpg",
                          width: 50,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                       SizedBox(
                    width: 20,
                  ),
                  ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncomeExpenzCard(
                        title: "Income", 
                        amount: 1200, 
                        ImageUrl: "expenz_app/assets/images/income.png", 
                        BgColor: kGreen,
                        
                      ),
                    ],
                  ),

                  IncomeExpenzCard(
                    title: "Expenze", 
                    amount: 2200, 
                    ImageUrl: "expenz_app/assets/images/expenz.png", 
                    BgColor: kRed,
                    
                  ),
                ],
              ),
            ),
          ),
         Text("Welcome $username",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
         ),
         ),
         SizedBox(
          width: 20,
         ),
         IconButton(onPressed:() {}, 
         icon: Icon(Icons.notifications,
         color: kMainColor,
         size: 30,
         ),
        ),

        ],
      ),
     )),
    );
  }
}