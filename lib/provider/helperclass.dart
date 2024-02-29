import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_updates_provider/database/models.dart';

class StudentProvider extends ChangeNotifier {
  File? selectedimage;
  List<Studentupdate> _studentlist = [];
  List<Studentupdate> get studentserachlist => _studentlist;

  getimage(File? image) {
    selectedimage = image;
    notifyListeners();
  }

  searchStudent(List<Studentupdate> newlist) {
    _studentlist = newlist;
  }
}
