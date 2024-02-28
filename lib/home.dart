// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:register_form/details.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

String? dropdownvalue = 'malappuram';

  var district = [
    'malappuram',
    'kozhikode',
    'trissur',
    'kollam',
    'kotayam'
  ];
  List l = [];
  var name = TextEditingController();
  var email = TextEditingController();
  var num = TextEditingController();
  String? gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/form.jpg',
                    width: 360,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Registration Form',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Name :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      decoration:
                          InputDecoration(enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Email :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          InputDecoration(enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Number :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: SizedBox(
                    width: 250,
                    height: 40,
                    child: TextFormField(
                      controller: num,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: RadioListTile(
                          title: Text('male'),
                          value: 'male',
                          groupValue: gender,
                          onChanged: (value) {
                            gender = value.toString();
                          }),
                    ),
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                          title: Text('female'),
                          value: 'female',
                          groupValue: gender,
                          onChanged: (value) {
                            gender = value.toString();
                          }),
                    ),
                    SizedBox(
                      width: 140,
                      child: RadioListTile(
                          title: Text('other'),
                          value: 'other',
                          groupValue: gender,
                          onChanged: (value) {
                            gender = value.toString();
                          }),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Text('District :',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: district.map((String district) {
                        return DropdownMenuItem(
                          value: district,
                          child: Text(district));
                      }).toList(),
                      
                      onChanged: (String? newValue){
                        setState(() {
                          dropdownvalue = newValue;
                        });
                      }),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        l.add({
                          'name' : name.text,
                          'email': email.text,
                          'number' : num.text,
                          'gender' : gender,
                          'district' : dropdownvalue
                        });
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => Person(
                              users : l
                            ),));
                      },
                      child: Text('Submit')),
                  ElevatedButton(
                      onPressed: () {
                        name.clear();
                        email.clear();
                        num.clear();
                        setState(() {
                          gender="";
                          dropdownvalue = 'malappuram';
                        });                        
                      },
                      child: Text('cancel'))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
