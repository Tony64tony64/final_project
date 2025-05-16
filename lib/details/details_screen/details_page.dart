import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_project/add_item/add_item_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_project/profile/user_model.dart';
import '../../HeartScreen.dart';
import '../details_widget/favorite.dart';
import '../details_widget/season.dart';
import '../details_widget/details_widget.dart';
import 'package:my_project/profile/profile_page/profile_page.dart';
import '../../add_item/Item_model.dart';

class DetailsPage extends StatefulWidget {
  // final String title;
  // final String body;
  // final List<File> images;

  const DetailsPage({
    super.key,
    // required this.title,
    // required this.body,
    // required this.images,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  Future<void> imageSelector(ImageSource source) async {
    try {
      final XFile? image = await imagePicker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon:
                profileImage != null && profileImage.path.isNotEmpty
                    ? CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    )
                    : const Icon(Icons.account_box),
          ),
        ],
        title: Text("The ${items.selectedItem!.title}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // (image==null || image!.isEmpty ?)
            // ? Image.asset("assets/tree.jpg")
            // :
            Image.file(
              items.selectedItem!.images.first,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(index: items.items.indexOf(items.selectedItem!)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(items.selectedItem!.body),
            ),

            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: items.selectedItem!.images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder:
                    (context, index) => Image.file(
                      items.selectedItem!.images[index],
                      fit: BoxFit.cover,
                    ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (builder) => const AddItemScreen()),
          );
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
