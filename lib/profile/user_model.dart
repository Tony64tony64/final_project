import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'user.dart';

class UserModel extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  User? _user;

  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    try {
      final XFile? image = await imagePicker.pickImage(
        source: source,
        imageQuality: 85,
      );

      if (image != null) {
        if (_user != null) {
          _user!.image = File(image.path);
        } else {
          _user = User(
            name: "Nour",
            bio: "Tonyton",
            image: File(image.path),
          );
        }
        notifyListeners();
        print('Image selected: ${image.path}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  void removeImage() {
    if (_user != null) {
      _user!.image = File('');
      notifyListeners();
    }
  }
}