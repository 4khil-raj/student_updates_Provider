// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<String> domain = [
    'Mern Stack',
    'Flutter',
    'Python',
    'Data Science',
    'Machine Lerning',
    'Cyber Security',
    'Java',
    'Not Conform'
  ];
  String? selectedDomain;

  List<String> place = [
    'Bangalure',
    'Kochi',
    'Calicut',
    'Trivandrum',
    'Chennai'
  ];
  String? selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.image)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Student Name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Contact'),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Select Domain',
                  focusedBorder: UnderlineInputBorder(),
                  // filled: true,
                  //fillColor: Colors.greenAccent,
                ),
                //  dropdownColor: const Color.fromARGB(255, 171, 185, 178),
                value: selectedDomain,
                onChanged: (String? newValue) {
                  selectedDomain = newValue!;
                },
                items: domain.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Select Hub',
                  focusedBorder: UnderlineInputBorder(),
                  // filled: true,
                  //fillColor: Colors.greenAccent,
                ),
                //  dropdownColor: const Color.fromARGB(255, 171, 185, 178),
                value: selectedPlace,
                onChanged: (String? newValue) {
                  selectedPlace = newValue!;
                },
                items: place.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
