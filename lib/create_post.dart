import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:webtech_flutter_app/api_service.dart';
import 'package:webtech_flutter_app/widgets/user_input.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late String email;
  late String message;
  late DateTime date;
  late String name;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  Map<String, dynamic>? userDetails = {};
  Map<String, dynamic>? _userDetails = {};
  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  Future<void> _getUserEmail() async {
    //obtain user email from firebase authentication
    String? userE = FirebaseAuth.instance.currentUser!.email;
    Map<String, dynamic>? userDetails =
        await ApiService().getUserProfile(userE!);

    setState(() {
      _userDetails = userDetails;
      _emailController.text = userE;
      name = _userDetails!['name'];
    });
  }

  @override
  void dispose() {
    //dispose controllers after use
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Message'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.png"),
            fit: BoxFit.cover, //fill background with wallpaper
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //use the created widget Userinput
              UserInput(
                controller: _emailController,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 16),
              UserInput(
                controller: _messageController,
                hintText: 'Write your message',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                //async added to function as it makes to api
                onPressed: () async {
                  try {
                    date = DateTime.now();
                    String fDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(
                        date); //date format shows time the message was sent
                    await ApiService().createPost(_emailController.text,
                        _messageController.text, fDate, name);
                    //redirect to the Feed page
                    GoRouter.of(context).go('/homepage/view_posts');
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
