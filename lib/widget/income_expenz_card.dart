import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/constance/constance.dart';
import 'package:flutter/material.dart';

class IncomeExpenzCard extends StatefulWidget {
  final String title;
  final double amount;
  final String ImageUrl;
  final Color BgColor;


  const IncomeExpenzCard({super.key, 
  required this.title, 
  required this.amount, 
  required this.ImageUrl,
   required this.BgColor,
   });

  @override
  State<IncomeExpenzCard> createState() => _IncomeExpenzCardState();
}

class _IncomeExpenzCardState extends State<IncomeExpenzCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
      color: widget.BgColor,
      borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(KDefaultPadding),
        child: Row(
          children: [
            Container(
              
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(widget.ImageUrl,
                width: 70,

                ),
              ),
              
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(widget.title,style: TextStyle(
                  fontSize: 17,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),),
                Text(
                  "\$ ${widget.amount.toStringAsFixed(0)}",style: TextStyle(
                  fontSize: 17,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            )
            
          ],
        ),
      ),
    );
  }
  
}