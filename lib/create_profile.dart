import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/exmethods.dart';

import 'api_service.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  // TextEditing Controllers will be responsible for capturing data after input has been made
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

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    final uEmail = FirebaseAuth.instance.currentUser!.email;
    //provide an initial value for the email text field
    setState(() {
      userEmail.text = uEmail!;
    });
  }

  bool isValidEmail(val) {
    final emailRegExp = RegExp(
        r"[A-Za-z]+@ashesi\.edu\.gh|@aucampus.onmicrosoft.com|@gmail.com");
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
    final idRegExp = RegExp(r"\b(20(0[0-9]|1[0-9]|2[0-7]))\b");

    return idRegExp.hasMatch(val);
  }

  bool isValidYear(val) {
    final idRegExp = RegExp(r"^(20((0[0-9])|(1[0-9])|(2[0-7])))$");
    return idRegExp.hasMatch(val);
  }

  @override
  Widget build(BuildContext context) {
    final currentContxt = context;

    return Scaffold(
        body: Center(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  TextEditingController().clear();
                },
                child: Form(
                  autovalidateMode: AutovalidateMode
                      .disabled, //only show the errors when user tries to submit
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
                          child: TextFormField(
                            controller: userName,
                            maxLines:
                                1, //most one word fields will take up one line
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Full Name',
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
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
                          child: TextFormField(
                            controller: userId,
                            keyboardType:
                                TextInputType.number, //accept numeric values
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'student ID',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                    r"[0-9]"), //constraint to only permit numeric values
                              )
                            ],
                            validator: (value) {
                              if (!isNotNull(value)) {
                                return 'Please enter school ID';
                              } else if (isValidId(value)) {
                                //school id used by alumni will work
                                return 'Enter valid school ID';
                              }
                              return null;
                            },
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
                          child: TextFormField(
                            controller: userEmail,
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email Address',
                            ),
                            validator: (value) {
                              if (!isNotNull(value)) {
                                return 'Please enter email';
                              } else if (!isValidEmail(value)) {
                                return 'Enter valid email';
                              }

                              return null;
                            },
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
                          child: TextFormField(
                            controller: userMajor,
                            keyboardType: TextInputType.name,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Current Major',
                            ),
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
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
                              }
                              // } else if (isValidYear(value)) {
                              //   return 'Enter valid graduation year';
                              // }
                              return null;
                            },
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 60)),
                          child: TextFormField(
                            controller: dob,
                            decoration: const InputDecoration(
                              labelText: "Birthday",
                            ),
                            onTap: () async {
                              DateTime? date = DateTime(1900);
                              FocusScope.of(context).requestFocus(FocusNode());
                              //user will select dob from the datepicker
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              dob.text = date!.toIso8601String();
                            },
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 65)),
                          child: TextFormField(
                            controller: favFood,
                            keyboardType: TextInputType.multiline,
                            maxLines: null, //more lines permitted
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText:
                                    'What is one of your favourite foods/snacks',
                                suffixIcon:
                                    Icon(Icons.restaurant_menu_outlined)),
                          )),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(const Size(500, 65)),
                          child: TextFormField(
                            controller: favMovie,
                            keyboardType: TextInputType
                                .multiline, //more than one line permitted
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:
                                  'Write the name of one movie that just blew your mind',
                              suffixIcon: Icon(Icons.emoji_emotions_outlined),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              //exclamation placed to catter for null form instances
                              if (_formKey.currentState!.validate()) {
                                try {
                                  //call to API to create user profiel with given values
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
                                  GoRouter.of(context).go('/homepage');
                                } catch (e) {
                                  // handle any errors that occur during the API call here
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Error creating profile: $e'),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text("Submit"),
                          )),
                    ],
                  ),
                ))));
  }
}
