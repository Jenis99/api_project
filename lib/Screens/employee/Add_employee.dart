import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add_employee extends StatefulWidget {
  const Add_employee({super.key});

  @override
  State<Add_employee> createState() => _Add_employeeState();
}

class _Add_employeeState extends State<Add_employee> {
  TextEditingController _employee=TextEditingController();
  TextEditingController _salary=TextEditingController();
  var _gender="male";
  var _department ="designing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
      ),
      body: SingleChildScrollView(
          child: (
              Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text("Employee Name",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _employee,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Salary",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _salary,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Gender",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                
                                Radio(
                                  value: "male", groupValue: _gender, onChanged: (value){
                                  setState(() {
                                    _gender=value!;
                                  });
                                },),
                                Text("Male") ,
                                Radio(
                                  value: "female", groupValue: _gender, onChanged: (value){
                                  setState(() {
                                    _gender=value!;
                                  });
                                },),
                                Text("Female"),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Text("Department",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 3.0,),
                            Container(child: DropdownButton(
                              value: _department,
                              onChanged: (val) {
                                setState(() {
                                  _department = val!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("Management",style: TextStyle(
                                    fontSize: 13.0,
                                  ),),
                                  value: "management",),
                                DropdownMenuItem(
                                  child: Text("Develpoing"),
                                  value: "develpoing",),
                                DropdownMenuItem(
                                  child: Text("Designing"),
                                  value: "designing",),
                              ],
                            ),
                            ),
                            Center(
                              child:  ElevatedButton(
                                onPressed: () async{

                                var name=_employee.text.toString();
                                var gender=_gender.toString();
                                var salary=_salary.text.toString();
                                var department=_department.toString();
                                 Uri url=Uri.parse("http://picsyapps.com/studentapi/insertEmployeeNormal.php");

                                  var params={
                                    "ename":name,
                                    "salary":salary,
                                    "department":department,
                                    "gender":gender,
                                  };

                                  var response=await http.post(url,body: params);
                                  if(response.statusCode==200){
                                    var json=jsonDecode(response.body.toString());
                                    if(json["status"]=="true"){
                                      var message=json["message"].toString();
                                      print(message);
                                    }
                                    else{
                                      var message=json["message"].toString();
                                      print(message);
                                    }
                                  }


                               
                                
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                child: Text("Add",style: TextStyle(
                                    fontSize: 20.0
                                ),),
                              )),
                            )
                          ],
                        )
                    ),
                  ]
              )
          )
      ),
    );
  }
}