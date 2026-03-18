import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/constance/constance.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const SharedOnboardingScreen({super.key, 
  required this.title, 
  required this.imagePath, 
  required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
          width: 100,
          fit: BoxFit.cover,
           ),
           SizedBox(
            height: 20,
           ),
           Text(title,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
           ),
           ),
      
          SizedBox(
            height: 20,
           ),
           Text(title,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w100,
            color: kGrey,
           ),)
        ],
      ),
    );
  }
}