import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'item.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';


class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;


  Future<void> addItem(Item item) async {
    final persistentImages = await Future.wait(
        item.images.map((img) => _makePersistentCopy(img))
    );
    _items.add(Item(
      images: persistentImages,
      title: item.title,
      body: item.body,
      favorite: false,
    ));
    notifyListeners();
  }


  Future<File> _makePersistentCopy(File original) async {
    final directory = await getApplicationDocumentsDirectory();
    final permanentPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await original.copy(permanentPath);
  }


  final ImagePicker imagepicker = ImagePicker();
  List<File> selectedImage = [];

  Future<void> imageSelector() async {
    final List<XFile>? images = await imagepicker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      selectedImage.addAll(images.map((img) => File(img.path)).toList());
      notifyListeners();
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < selectedImage.length) {
      selectedImage.removeAt(index);
      notifyListeners();
    }
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
}


