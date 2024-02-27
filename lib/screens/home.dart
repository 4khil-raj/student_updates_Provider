import 'package:flutter/material.dart';
import 'package:student_updates_provider/database/fuctions.dart';
import 'package:student_updates_provider/database/models.dart';
import 'package:student_updates_provider/screens/registration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 12),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (reg) => RegisterScreen()));
          },
          icon: Icon(Icons.add),
          label: Text("Add Student"),
        ),
      ),
      appBar: AppBar(
        title: Text('StudentUpdate'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: studentlist,
            builder: (context, List<Studentupdate> students, Widget? child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      final studentdata = students.reversed.toList()[index];
                      return Container();
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
