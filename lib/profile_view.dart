import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webtech_flutter_app/widgets/viewtextfield.dart';
import 'services/signin.dart';
import 'services/api_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String? uemail = FirebaseAuth.instance.currentUser!.email;
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
        //asynchronously fetch user data from an API, and displaying the data once it is available.
        body: FutureBuilder(
            future: ApiService().getUserProfile(
                uemail!), 
            builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
              switch (snapshot.connectionState) {
                //handle all connection states 
                case ConnectionState.done:
                case ConnectionState.active:
                case ConnectionState.waiting:
                //to prevent trying to load null values
                  if (snapshot.hasData) {
                    var user = snapshot.data!;
                    return SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Container(
                            height: 400,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 138, 137, 137),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircleAvatar(
                                  child:  Icon(
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
                                  //make use of the custom made list tile to show each user detail
                                  CustomListTile(
                                    title: "Full name",
                                    subtitle: user["name"],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    thickness: .2,
                                  ),
                                 CustomListTile(
                                    title: "Email",
                                    subtitle: user["email"],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    thickness: 0.2,
                                  ),
                                  CustomListTile(
                                    title: "Student ID",
                                    subtitle: user["id"],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    thickness: .2,
                                  ),
                                  CustomListTile(
                                    title: "Major",
                                    subtitle: user["major"],
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  CustomListTile(
                                    title: "Year",
                                    subtitle: user["year"],
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  CustomListTile(
                                    title: "Your favourite food",
                                    subtitle: user["food"],
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  CustomListTile(
                                    title: "Your favourite movie",
                                    subtitle: user["movie"],
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 12, 12, 12),
                                      thickness: .2),
                                  CustomListTile(
                                    title: "Are you a campus resident?",
                                    subtitle: user["res"],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]));
                  } else {
                    //if snapshot doesnt have data yet, keep loading
                    return Center(
                        child: Column(
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ));
                  }
                default:
                  return Center(
                      child: Column(
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ));
              }
            }));
  }
}
