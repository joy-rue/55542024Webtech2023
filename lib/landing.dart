import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:webtech_flutter_app/signin.dart';
import 'package:webtech_flutter_app/signup.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
           decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/wallpaper.png"),
                        fit: BoxFit.cover,
                      )
                    ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome to Ashesi Social Space',
                      
                    ),
                    const SizedBox(height: 18.0),
                    const Text(
                      'Sign in to start interacting with others',
                     
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          
                          onPressed: () {
                            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
                          },
                          child: const Text('Sign up'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                           Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
                          },
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
