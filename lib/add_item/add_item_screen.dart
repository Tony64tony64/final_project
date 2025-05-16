import 'package:flutter/material.dart';
import 'package:my_project/add_item/Item_model.dart';
import 'package:my_project/add_item/item.dart';
import 'package:my_project/dashboard/nav_bar.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<AddItemScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  @override
  void dispose() {
    body.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemModel = Provider.of<ItemModel>(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/tree3.jpg"),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            itemModel.selectedImage.isEmpty
                ? Container(
              color: Colors.white30,
              height: 150,
              width: MediaQuery.of(context).size.width - 20,
              child: IconButton(
                onPressed: itemModel.imageSelector,
                icon: const Icon(Icons.camera_alt),
              ),
            )
                : Row(
              children: [
                Container(
                  color: Colors.white30,
                  height: 100,
                  width: 100,
                  child: IconButton(
                    onPressed: itemModel.imageSelector,
                    icon: const Icon(Icons.camera_alt),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 120,
                  child: Consumer<ItemModel>(
                    builder: (context, itemModel, child) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: itemModel.selectedImage.map((img) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image.file(
                                  img,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    itemModel.removeImage(itemModel.selectedImage.indexOf(img));
                                  },
                                  icon: const Icon(Icons.cancel),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                controller: title,
                decoration: const InputDecoration(
                  hintText: "title",
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                controller: body,
                decoration: const InputDecoration(
                  hintText: "body",
                  border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {

          final item = Provider.of<ItemModel>(context,listen: false);
          item.addItem(Item(images: item.selectedImage!,
              title: title.text,
              body: body.text,
              favorite: false));
          item.selectedImage.clear();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavBar()
              )
          );

        },
      ),
    );
  }
}