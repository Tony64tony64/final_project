import 'package:flutter/material.dart';
import 'package:my_project/add_item/add_item_screen.dart';
import 'package:my_project/add_item/item.dart';
import 'package:my_project/details/details_screen/details_page.dart';
import 'package:my_project/details/details_widget/favorite.dart';
import 'package:my_project/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

import '../add_item/Item_model.dart';
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    final fav = Provider.of<FavoriteModel>(context);

    return Scaffold(
      appBar:AppBar(


        title:Row(children : [Text("Dashboard"),]),



        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, size: 30, color: Colors.redAccent),
              SizedBox(width: 6), // space between icon and badge
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text(
                  '${fav.fav.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),


          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: profileImage != null && profileImage.path.isNotEmpty
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

      ),
      body: items.items.isEmpty
          ? Center(child:
      Text
        (
          "No Items"

      )

      )
          : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(


              crossAxisCount: 2,
              crossAxisSpacing: 10
          ),

          itemCount: items.items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                items.selectItem(Item(
                  images: items.items[index].images,
                  title: items.items[index].title,
                  body: items.items[index].body,
                  favorite: items.items[index].favorite,
                ));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              child: SizedBox(child: Column(
                children: [

                  items.items[index].images.isNotEmpty
                      ? Image.file(
                    items.items[index].images.first,
                    height: 125,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                      : Text("No image selected",
                      style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items.items[index].title),
                      FavoriteWidget(
                        index: items.items.indexOf(items.items[index]),),

                    ],
                  )

                ],)),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}