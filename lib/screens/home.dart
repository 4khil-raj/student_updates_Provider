// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:student_updates_provider/database/fuctions.dart';
import 'package:student_updates_provider/screens/registration.dart';
import 'package:student_updates_provider/widget/home_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 12),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (reg) => const RegisterScreen()));
            },
            icon: Icon(
              Icons.add,
              size: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            label: Text("Add Student",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 250,
              centerTitle: true,
              title: Column(
                children: [
                  Image.network(
                    'https://brototype.com/careers/images/logo/logo-black.png',
                    filterQuality: FilterQuality.high,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Student Details',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
        body: CustomList());
  }
}
