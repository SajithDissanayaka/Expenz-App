import 'package:expenz_app/models/expenz_model.dart';
import 'package:flutter/material.dart';

//income catogory enum
enum IncomeCatagory{
  freelance,
  salary,
  passive,
  sale,
}
//catogory image
final Map<IncomeCatagory, String> incomeCatogaryImages = {
  IncomeCatagory.freelance : "expenz_app/assets/images/freelance.png",
  IncomeCatagory.passive : "expenz_app/assets/images/car.png",
  IncomeCatagory.salary : "expenz_app/assets/images/health.png",
  IncomeCatagory.sale : "expenz_app/assets/images/salary.png",
};
//catogory colors

final Map<IncomeCatagory, Color > incomeCatogoryColor = {
  IncomeCatagory.freelance : Color(0xffe57373),
  IncomeCatagory.passive : Color(0xffb1c784),
  IncomeCatagory.salary : Color(0xff64b5f6),
  IncomeCatagory.sale : Color(0xffffd54f),
};

 class Income{
  final int id;
  final String title;
  final double amount;
  final IncomeCatagory catagory;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id, 
    required this.title, 
    required this.amount, 
    required this.catagory, 
    required this.date,
    required this.time,
    required this.description,
    });

  //convert to data to JSON model
  Map<String, dynamic> toJSON(){
    return {
      'id':id,
      'title':title,
      'amount':amount,
      'catagory':catagory.index,
      'date':date.toIso8601String(),
      'time':time.toIso8601String(),
      'description':description,
    };
  }
  //convert json object to 
  factory Income.fromJSON(Map<String, dynamic> json){
    return Income(
      id: json['id'],
       title: json['title'], 
       amount: json['amount'], 
       catagory: IncomeCatagory.values[json['catagory']], 
       date: DateTime.parse(json['date']), 
       time: DateTime.parse(json['time']), 
       description: json['description']);
 
    }
  }
