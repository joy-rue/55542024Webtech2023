import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:webtech_flutter_app/api_service.dart';

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
    String? userE = FirebaseAuth.instance.currentUser!.email;
    Map<String, dynamic>? userDetails =
        await ApiService().getUserProfile(userE!);

    setState(() {
      _userDetails = userDetails;
      _emailController.text = _userDetails!['email'];
      name = _userDetails!['name'];
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentContxt = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Message'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Enter your message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                  onChanged: (value) {
                    message = value;
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    date = DateTime.now();
                    String fDate =
                        DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
                    await ApiService().createPost(
                        _emailController.text, message, fDate, name);
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
