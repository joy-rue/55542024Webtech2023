import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webtech_flutter_app/api_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  final dob = TextEditingController();
  final yearGroup = TextEditingController();
  final userMajor = TextEditingController();
  final res = TextEditingController();
  final favFood = TextEditingController();
  final favMovie = TextEditingController();
  Map<String, dynamic>? userDetails = {};

  Map<String, dynamic>? _userDetails = {};

  bool? _residenceStatus;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    userDetails = await ApiService().editUserProfile("55542024");
    setState(() {
      _userDetails = userDetails;
    });
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showImagePicker(context);
                    },
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: _imageFile != null
                            ? DecorationImage(
                                image: FileImage(_imageFile!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _imageFile == null
                          ? const Icon(
                              Icons.person,
                              size: 100.0,
                            )
                          : null,
                    ),
                  ),
                ),
                const Text("Favorite Food"),
                TextFormField(
                  controller: favFood,
                  initialValue: _userDetails!['food'],
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
                  initialValue: _userDetails!['movie'],
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
                      borderSide:
                          BorderSide(color: Theme.of(context).errorColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).errorColor),
                    ),
                    errorStyle: const TextStyle(fontSize: 12.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Residence Status"),
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: _residenceStatus,
                      onChanged: (value) {
                        setState(() {
                          _residenceStatus = value;
                        });
                      },
                    ),
                    const Text("On Campus"),
                    const SizedBox(width: 16.0),
                    Radio<bool>(
                      value: false,
                      groupValue: _residenceStatus,
                      onChanged: (value) {
                        setState(() {
                          _residenceStatus = value;
                        });
                      },
                    ),
                    const Text("Off Campus"),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text("Year Group"),
                TextFormField(
                  controller: yearGroup,
                  initialValue: _userDetails!['year'],
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
                  initialValue: _userDetails!['major'],
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
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await ApiService().editUserProfile(_userDetails!['id'],
                          food: favFood.text,
                          movie: favMovie.text,
                          year: yearGroup.text,
                          major: userMajor.text,
                          res: _residenceStatus! as String);
                      Navigator.of(context).pop();
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
