import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'options.dart';
import '../user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _name;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'No Name';
      _email = prefs.getString('email') ?? 'No Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Consumer<UserModel>(
                builder: (context, userModel, child) {
                  final user = userModel.user;
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 110,
                        backgroundImage: user?.image.path.isNotEmpty == true
                            ? FileImage(user!.image)
                            : null,
                        child: user?.image.path.isEmpty ?? true
                            ? const Icon(
                          Icons.person,
                          size: 200,
                        )
                            : null,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                padding: const EdgeInsets.all(16),
                                height: 200,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Choose Option",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Options(
                                          title: "Camera",
                                          icon: Icons.camera_alt,
                                          onPressed: () async {
                                            await userModel.imageSelector(
                                                ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Options(
                                          title: "Gallery",
                                          icon: Icons.photo,
                                          onPressed: () async {
                                            await userModel.imageSelector(
                                                ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Options(
                                          title: "Delete",
                                          icon: Icons.delete,
                                          color: Colors.red,
                                          onPressed: () {
                                            if (userModel.user != null) {
                                              userModel.removeImage();
                                            }
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Name"),
              subtitle: Text(_name ?? 'Loading...'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: Text(_email ?? 'Loading...'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          icon: Icon(Icons.logout),
          label: Text('Logout'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}