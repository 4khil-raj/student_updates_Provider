import 'dart:io';

import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  File? selectedimage;

  getimage(File image) {
    selectedimage = image;
    notifyListeners();
  }
}
