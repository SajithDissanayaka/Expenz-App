import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/constance/constance.dart';
import 'package:expenz_app/models/expenz_model.dart';
import 'package:expenz_app/models/income_model.dart';
import 'package:expenz_app/widget/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {

        int _SelectedMethod = 0;
        ExpenzCatogoory _expenzCatogoory = ExpenzCatogoory.health;
        IncomeCatagory _incomeCatagory = IncomeCatagory.salary;
        final TextEditingController _titleController = TextEditingController();
        final TextEditingController _descriptionController = TextEditingController();
        final TextEditingController _amountController = TextEditingController();
        DateTime _selectedDate = DateTime.now();
        DateTime _selectedTime = DateTime.now();

        @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _SelectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
        child: SingleChildScrollView(
          child: Stack(
            
            children: [
              //expenz and income toggle menu
              Padding(
                padding: const EdgeInsets.all(KDefaultPadding),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(100),
                        
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                
                      //Expenz box
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _SelectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            color: _SelectedMethod == 0 ? kRed : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
                            child: Text("Expenz",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _SelectedMethod == 0 ? kWhite : kBlack,
                            ),),
                          )),
                      ),
                
                        //Income box 
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _SelectedMethod = 1;
                            });
                          },
                          child: Container(
                          decoration:  BoxDecoration(
                            color: _SelectedMethod == 1 ? kGreen : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
                            child: Text("Income",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _SelectedMethod == 1 ? kWhite : kBlack,
                            ),),
                          )),
                        ),
                      
                    ],
                  ),
                ),
              ),
          
              //amount fiild
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
                child: Container(
                  margin: EdgeInsets.only(left: 40.0,
                  top: MediaQuery.of(context).size.height * 0.1,
                  
                  ),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How much ?",style: TextStyle(
                        color: kLightGrey.withOpacity(0.5),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      TextField(
                  style: TextStyle(
                    fontSize: 16,
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "0",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kWhite,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    )
                
                  ),
                ),
                    ],
                  ),
                ),
              ),
          
              //user data form
              Container(
                height: 300,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.6,
                ),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    
                    child: Column(
                      children: [
                        //catogary selecter dropdown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: KDefaultPadding,
                            horizontal: KDefaultPadding),
                          ),
                          items: _SelectedMethod == 0 ? ExpenzCatogoory.values.map((category){
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList():
                          
                           _SelectedMethod == 1 ? IncomeCatagory.values.map((category){
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList(),
                          

                           onChanged: (value){
                            setState(() {
                              _SelectedMethod == 0 ? _expenzCatogoory = value as ExpenzCatogoory : 
                              _incomeCatagory = value as IncomeCatagory;
                              print(_SelectedMethod == 0 ? _expenzCatogoory:
                                                                               _incomeCatagory);
                            });
                           } ,),
                           SizedBox(
                            height: 20,
                           ),

                           //title field
                           TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),

                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: KDefaultPadding,
                            horizontal: KDefaultPadding),


                            ),
                           ),
                            SizedBox(
                              height: 20,
                            ),

                          //description field
                           TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),

                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: KDefaultPadding,
                            horizontal: KDefaultPadding),


                            ),
                           ),
                            SizedBox(
                              height: 20,
                            ),

                           // amount field
                            TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),

                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: KDefaultPadding,
                            horizontal: KDefaultPadding),


                            ),
                           ),
                            SizedBox(
                              height: 20,
                            ),

                           //date field
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                   firstDate: DateTime(2020), 
                                   lastDate: DateTime(2026),
                                   
                                   ).then((value) =>{
                                   if(value != null){
                                    setState((){
                                      _selectedDate = value;
                                    })
                                   }
                                   }
                                   );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kMainColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_month_outlined,
                                        color: kWhite,
                                        
                                        ),
                                
                                        SizedBox(
                                          width: 10,
                                        ),
                                
                                        Text("Select Date",style: TextStyle(
                                          color: kMainColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(_selectedDate),style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                           ),
                           SizedBox(
                            height: 10,
                           ),

                           //time pickels

                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  showTimePicker(context: context, 
                                  initialTime: TimeOfDay.now());
                                }.then((value) =>{
                                  if(value!= null){
                                    setState(() {
                                      _selectedTime = DateTime(
                                      _selectedDate.year,
                                      _selectedDate.month,
                                      _selectedDate.day,
                                      value.hour,
                                      value.minute,
                                    );
                                    }),
                                  
                                  }
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kYellow,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.punch_clock,
                                        color: kWhite,
                                        
                                        ),
                                
                                        SizedBox(
                                          width: 10,
                                        ),
                                
                                        Text("Select Time",style: TextStyle(
                                          color: kMainColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                               DateFormat.jm().format(_selectedTime),style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                           ),

                           SizedBox(
                            height: 20,
                           ),

                           //divider
                           Divider(
                            color: kGrey,
                            thickness: 5,
                           ),

                           //button
                           CustomeButton(
                            buttonName: "Add", 
                            buttonColor: _SelectedMethod == 0 ? kRed : kGreen)
                      ],
                    ),
                  ),
                ),
              )
              
          
            ],
          ),
        ),
      )),
    );
  }
}

extension on Null Function() {
  GestureTapCallback? then(Set<Set<void>> Function(value) param0) {}
}