import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'api_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

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
                GoRouter.of(context).go('/homepage/view_profile/edit_profile');
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: ApiService().getUserProfile(
                userId), // a previously-obtained Future<String> or null
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
                            height: 400,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 138, 137, 137),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircleAvatar(
                                  child: const Icon(
                                Icons.person,
                                size: 100.0,
                              )),
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
                                              Color.fromARGB(255, 80, 80, 80),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user["name"],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    thickness: .2,
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Email",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user["email"],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    thickness: 0.2,
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Student ID",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['id'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    thickness: .2,
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Major",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['major'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  ListTile(
                                    title: const Text(
                                      "Year",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['year'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  ListTile(
                                    title: const Text(
                                      "Favorite food",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['food'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  ListTile(
                                    title: const Text(
                                      "Favorite movies",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['movie'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  ListTile(
                                    title: const Text(
                                      "Are you an On-campus resident",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w200),
                                    ),
                                    subtitle: Text(
                                      user['res'],
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                          fontWeight: FontWeight.w100),
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
