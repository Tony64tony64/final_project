import 'package:flutter/material.dart';
import 'package:my_project/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        actions: [
          Consumer<FavoriteModel>(
            builder: (context, fav, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: null,
                  ),
                  if (fav.fav.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text(
                          '${fav.fav.length}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body:
      Consumer<FavoriteModel>(
          builder: (context, fav, child) {
            return fav.fav.isEmpty
                ? Center(
              child: Text(
                "No Items "
                ,
              ),
            )
                : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                ),
                itemCount:fav.fav.length ,
                itemBuilder: (context , index){
                  return SizedBox(child: Column(
                    children: [

                      fav.fav[index].images.isNotEmpty
                          ? Image.file(
                        fav.fav[index].images.first,
                        height: 125,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                          : Text("No image selected", style: TextStyle(color: Colors.grey)),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [
                          Text(fav.fav[index].title),
                          IconButton(
                            onPressed: (){
                              fav.fav[index].favorite=false;

                              fav.remove(fav.fav[index]);
                            },
                            icon: Icon(Icons.favorite),color:Colors.red,),
                        ],
                      )

                    ],));

                }
            );
          }),

    );
  }
}