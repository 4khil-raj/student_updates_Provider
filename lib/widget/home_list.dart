// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_updates_provider/database/crud_operations.dart';
import 'package:student_updates_provider/database/fuctions.dart';
import 'package:student_updates_provider/database/models.dart';

class CustomList extends StatefulWidget {
  const CustomList({super.key});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: studentlist,
          builder: (context, List<Studentupdate> students, Widget? child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    final studentdata = students.reversed.toList()[index];
                    return InkWell(
                      onTap: () {},
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          SlidableAction(
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Remove',
                              onPressed: (context) {
                                delete(context, studentdata.id);
                              }),
                          SlidableAction(
                              label: 'Edit',
                              icon: Icons.edit,
                              backgroundColor:
                                  const Color.fromARGB(255, 33, 243, 72),
                              onPressed: (context) {})
                        ]),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 6, top: 12, bottom: 12),
                                child: CircleAvatar(
                                  radius: 41,
                                  backgroundImage:
                                      FileImage(File(studentdata.image!)),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                studentdata.name!.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 26,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ],
    );
  }
}
