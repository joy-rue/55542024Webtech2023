import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:webtech_flutter_app/exmethods.dart';

import 'api_service.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}
//student ID number, name, email, date of birth, year
// group, major, whether or not they have campus residence, their best food, and their best
// movie

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userId = TextEditingController();
  final userEmail = TextEditingController();
  final dob = TextEditingController();
  final yearGroup = TextEditingController();
  final userMajor = TextEditingController();
  final res = TextEditingController();
  final favFood = TextEditingController();
  final favMovie = TextEditingController();

  bool isValidEmail(val) {
    final emailRegExp = RegExp(r"[A-Za-z]+\.[A-Za-z]+@ashesi\.edu\.gh");
    return emailRegExp.hasMatch(val);
  }

  bool isValidPassword(val) {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(val);
  }

  bool isNotNull(val) {
    return val != null;
  }

  bool isValidId(val) {
    final idRegExp = RegExp(r"^(20(0[0-9]|1[0-9]|2[0-7]))$");

    return idRegExp.hasMatch(val);
  }

  bool isValidYear(val) {
    final idRegExp = RegExp(r"\b(20(0[0-9]|1[0-9]|2[0-7]))\b");
    return idRegExp.hasMatch(val);
  }

  @override
  Widget build(BuildContext context) {
    final currentContxt = context;
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              TextEditingController().clear();
            },
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: userName,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Full Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (!isNotNull(value)) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: userId,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'student ID',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (!isNotNull(value)) {
                            return 'Please enter school ID';
                          } else if (isValidId(value)) {
                            return 'Enter valid school ID';
                          }
                          return null;
                        },
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: userEmail,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email Address',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (!isNotNull(value)) {
                            return 'Please enter email';
                          } else if (!isValidEmail(value)) {
                            return 'Enter valid ashesi email';
                          }

                          return null;
                        },
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: userMajor,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Current Major',
                        ),
                        // The validator receives the text that the user has entered.
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: yearGroup,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'year group',
                        ),
                        validator: (value) {
                          if (!isNotNull(value)) {
                            return 'Please enter graduation year';
                          } else if (isValidYear(value)) {
                            return 'Enter valid graduation year';
                          }
                          return null;
                        },
                        // The validator receives the text that the user has entered.
                      )),
                  // ConstrainedBox(
                  //     constraints: BoxConstraints.tight(const Size(500, 50)),
                  //     child: TextFormField(
                  //       controller: dob,
                  //       keyboardType: TextInputType.datetime,
                  //       maxLines: 1,
                  //       decoration: const InputDecoration(
                  //         border: UnderlineInputBorder(),
                  //         labelText: 'Date of Birth',
                  //       ),

                  //       // The validator receives the text that the user has entered.
                  //     )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(500, 50)),
                      child: TextFormField(
                        controller: dob,
                        decoration: const InputDecoration(
                          labelText: "Birthday",
                        ),
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          dob.text = date!.toIso8601String();
                        },
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(400, 100)),
                      child: TextFormField(
                        controller: favFood,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:
                                'What is one of your favourite foods/snacks',
                            suffixIcon: Icon(Icons.restaurant_menu_outlined)),
                        // The validator receives the text that the user has entered.
                      )),
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(400, 100)),
                      child: TextFormField(
                        controller: favMovie,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText:
                              'Write the name of one movie that just blew your mind',
                          suffixIcon: Icon(Icons.emoji_emotions_outlined),
                        ),

                        // The validator receives the text that the user has entered.
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          //exclamation placed to catter for null form instances
                          if (_formKey.currentState!.validate()) {
                            try {
                              Map<String, dynamic>? result =
                                  await ApiService().createUserProfile(
                                userName.text,
                                userEmail.text,
                                userId.text,
                                dob.text,
                                yearGroup.text,
                                userMajor.text,
                                favFood.text,
                                favMovie.text,
                                res.text,
                              );

                              print('done');
                              Navigator.of(currentContxt).pop();
                            } catch (e) {
                              // handle any errors that occur during the API call here
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error creating profile: $e'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text("Submit"),
                      )),
                ],
              ),
            )));
  }
}
