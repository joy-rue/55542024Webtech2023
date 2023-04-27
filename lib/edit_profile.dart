import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/api_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //obtain saved user information form database
  final _formKey = GlobalKey<FormState>();
  final dob = TextEditingController();
  final yearGroup = TextEditingController();
  final userMajor = TextEditingController();
  final res = TextEditingController();
  final favFood = TextEditingController();
  final favMovie = TextEditingController();
  Map<String, dynamic>? userDetails = {};

  Map<String, dynamic>? _userDetails = {};

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    var uemail = FirebaseAuth.instance.currentUser!.email;
    userDetails = await ApiService().getUserProfile(uemail!);
    setState(() {
      //load user information from database
      _userDetails = userDetails;
      yearGroup.text = _userDetails!["year"];
      userMajor.text = _userDetails!["major"];
      favMovie.text = _userDetails!["movie"];
      favFood.text = _userDetails!["food"];
      res.text = _userDetails!["res"];
      dob.text = _userDetails!["dob"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Icon(
                  Icons.person,
                  size: 100.0,
                )),
                const Text("Favorite Food"),
                TextFormField(
                  controller: favFood,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your favorite food';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Favorite Movie"),
                TextFormField(
                  controller: favMovie,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your favorite movie';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Are you an on Campus Resident?"),
                TextFormField(
                  controller: res,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Year Group"),
                TextFormField(
                  controller: yearGroup,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your year group';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                    hintText: 'Enter your favorite movie',
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Major"),
                TextFormField(
                  controller: userMajor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your major';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    //if all fields are valid
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //change user details
                      await ApiService().editUserProfile(_userDetails!['id'],
                          food: favFood.text,
                          movie: favMovie.text,
                          year: yearGroup.text,
                          major: userMajor.text,
                          res: res.text);
                      //soon after save, go to the profile page
                      GoRouter.of(context).go('/homepage/view_profile');
                    }
                  },
                  child: const Text("Save Changes"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
