// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

String dropvalue = 'select';

  var district = [
    'malappuram',
    'kozhikode',
    'trissur',
    'kollam',
    'kotayam'
  ];
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
                  child: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: dropvalue,
                    items: district.map((String district) {
                      return DropdownMenuItem(
                        value: district,
                        child: Text(district,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),));
                    }).toList(),
                     onChanged: (String? newValue){
                      setState(() {
                        dropvalue = newValue!;
                      });
                     }),
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
                        print(name.text);
                        print(email.text);
                        print(num.text);
                        print(gender);
                      },
                      child: Text('Submit')),
                  ElevatedButton(
                      onPressed: () {
                        name.clear();
                        email.clear();
                        num.clear();
                        
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
