import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:webtech_flutter_app/edit_profile.dart';
import 'package:webtech_flutter_app/exmethods.dart';
import 'package:webtech_flutter_app/create_profile.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String userId = "55542024";

  Map<String, dynamic> _userDetails = {};

// Usage in build method
  @override
  Widget build(BuildContext context) {
    if (_userDetails == null) {
      return const Card(child: Text("Loading"));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: ApiService().getUserProfile(
                "55542024"), // a previously-obtained Future<String> or null
            builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  if (snapshot.hasData) {
                    var user = snapshot.data!;
                    return SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundImage:
                                    AssetImage("assets/images/student.png"),
                                radius: 80.0,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                    title: const Text(
                                      "Full name",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user["name"],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Email",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user["email"],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Student ID",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['id'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Major",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['major'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Year",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['year'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Favorite food",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['food'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "Favorite movies",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['movie'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12)),
                                  ListTile(
                                    title: const Text(
                                      "On-campus resident",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                    subtitle: Text(
                                      user['res'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]));
                  } else {
                    return Column(
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }
                default:
                  return Column(
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
              }
            }));
  }
}
