// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_updates_provider/database/crud_operations.dart';
import 'package:student_updates_provider/provider/helperclass.dart';

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
  File? selectedImage;

  List<String> place = [
    'Bangalure',
    'Kochi',
    'Calicut',
    'Trivandrum',
    'Chennai'
  ];
  String? selectedPlace;
  final _formKey = GlobalKey<FormState>();
  final contactController = TextEditingController();
  final studentnameContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          title: Text(
            'Register',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(border: Border.all()),
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  final picker = ImagePicker();
                                  final pickedImage = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (pickedImage != null) {
                                    selectedImage = File(pickedImage.path);
                                    value.getimage(selectedImage!);
                                  }
                                },
                                icon: Icon(Icons.image)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: studentnameContoller,
                    decoration: InputDecoration(hintText: 'Student Name'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: contactController,
                    decoration: InputDecoration(hintText: 'Contact'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: DropdownButtonFormField(
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
                      items:
                          domain.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: DropdownButtonFormField(
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
                      items:
                          place.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      registerStudent(
                          context,
                          studentnameContoller.text.trim(),
                          selectedPlace!,
                          selectedDomain!,
                          int.parse(contactController.text),
                          selectedImage!.path,
                          _formKey);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
