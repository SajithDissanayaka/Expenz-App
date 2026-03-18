import 'package:flutter/material.dart';

class UserdataScreen extends StatefulWidget {
  const UserdataScreen({super.key});

  @override
  State<UserdataScreen> createState() => _UserdataScreenState();
}

class _UserdataScreenState extends State<UserdataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
    );
  }
  }