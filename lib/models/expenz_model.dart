//enum for expenz catogory

import 'package:flutter/material.dart';

enum ExpenzCatogoory {
  food,
  transport,
  health,
  shopping,
  subscription,
}
//catogary images
final Map<ExpenzCatogoory , String> expenzCatogoryImages = {
  ExpenzCatogoory.food : "expenz_app/assets/images/restaurant.png",
  ExpenzCatogoory.transport : "expenz_app/assets/images/car.png",
  ExpenzCatogoory.health : "expenz_app/assets/images/health.png",
  ExpenzCatogoory.shopping : "expenz_app/assets/images/bag.png",
  ExpenzCatogoory.subscription : "expenz_app/assets/images/bill.png",
};

//Expenz catogory color

final Map<ExpenzCatogoory, Color> expenzCatogoryColors = {
  ExpenzCatogoory.food : Color(0xffe57373),
  ExpenzCatogoory.transport : Color(0xff81c784),
  ExpenzCatogoory.health : Color(0xf64b5f6),
  ExpenzCatogoory.shopping : Color(0xffffd54f),
  ExpenzCatogoory.subscription : Color(0xff9575cd),
};

class Expenz {
  final int id;
  final String title;
  final double amount;
  final ExpenzCatogoory catagory;
  final DateTime date;
  final DateTime time;
  final String description;

  Expenz({
    required this.id, 
    required this.title,
    required this.amount,
    required this.catagory,
    required this.date, 
    required this.time, 
    required this.description});

//convert the expenz object into JSON object
Map < String , dynamic > toJSON(){
  return {
    'id':id,
    'title': title,
    'amount': amount,
    'catagory':catagory.index,
    'date':date.toIso8601String(),
    'time':time.toIso8601String(),
    'description':description,

  };
}
//cretae an expenz object from a JSON object
factory Expenz.fromJSON(Map<String , dynamic> json){
  return Expenz(
    id: json['id'], 
    title: json['title'],
     amount: json['amount'], 
     catagory: ExpenzCatogoory.values[json['catagory']], 
     date: DateTime.parse(json['date']), 
     time: DateTime.parse(json['time']), 
     description: json['description']
  );
}
    
}

