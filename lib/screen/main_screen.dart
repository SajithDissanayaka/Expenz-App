import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/screen/Home_screen.dart';
import 'package:expenz_app/screen/add_new_screen.dart';
import 'package:expenz_app/screen/budget_screen.dart';
import 'package:expenz_app/screen/profile_screen.dart';
import 'package:expenz_app/screen/transaction_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  //current page index

  int _CurrentPageIndex = 0;

  Widget build(BuildContext context) {

    //screen list
    final List<Widget> pages = [
      HomeScreen(),
      TransactionScreen(),
      AddNewScreen(),
      BudgetScreen(),
      ProfileScreen(),

    ];



    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _CurrentPageIndex,
        onTap: (index){
          setState(() {
            _CurrentPageIndex = index;
          });
        },

        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),

        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: "Transfer",
          ),

          BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWhite,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: kWhite,
              size: 30,
              ),
              ),
              label: "",
          
          ),
          


          BottomNavigationBarItem(
          icon: Icon(Icons.rocket),
          label: "budget",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          )
        ]),
        body: pages[_CurrentPageIndex],
    );
  }
}