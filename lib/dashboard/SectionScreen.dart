import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_project/profile/user_model.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child:
                profileImage != null && profileImage.path.isNotEmpty
                    ? CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )
                    : Icon(Icons.account_box, size: 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/tree.jpg", width: 50),

              Image.asset("assets/tree.jpg", height: 100),

              Image.asset("assets/tree.jpg", height: 80),
            ],
          ),
        ],
      ),
    );
  }
}
