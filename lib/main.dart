import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/create_post.dart';
import 'package:webtech_flutter_app/create_profile.dart';
import 'package:webtech_flutter_app/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webtech_flutter_app/posts_view.dart';
import 'package:webtech_flutter_app/profile_view.dart';
import 'package:webtech_flutter_app/signin.dart';
import 'package:webtech_flutter_app/signup.dart';
import 'edit_profile.dart';
import 'firebase_options.dart';
import 'api_service.dart';
import 'landing.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //intializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//Creating the routes to be configured insde the Material App
final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomeScreen(),
      routes: <GoRoute>[
        //the login and  signup pages are located within the Welcome page route
        GoRoute(
          path: 'login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
            path: 'sign_up',
            builder: (context, state) => const SignUp(),
            routes: <GoRoute>[
              //the create profile page is embeded within the signUp so that users onyl get to create one profile with their signUp email
              GoRoute(
                path: 'create_profile',
                redirect: (BuildContext context, GoRouterState state) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    return '/';
                  } else {
                    return null;
                  }
                },
                builder: (context, state) => const CreateProfile(),
              ),
            ]),
            //the home page is on the same level as the login and signup
        GoRoute(
            path: 'homepage',
            redirect: (BuildContext context, GoRouterState state) { //defines the redirect path
              //if person happens to get link to homepage without logging in, redirect them to Welcome page
              if (FirebaseAuth.instance.currentUser == null) {
                return '/';
              } else {
                return null;
              }
            },
            builder: (context, state) => const HomePage(),
            routes: <GoRoute>[
              // profile and posts pages are found within the homepage route
              GoRoute(
                  path: 'view_profile',
                  redirect: (BuildContext context, GoRouterState state) {
                    if (FirebaseAuth.instance.currentUser == null) {
                      return '/';
                    } else {
                      return null;
                    }
                  },
                  builder: (context, state) => const ProfileView(),
                  routes: [
                    //user finds the edit profile page within the profile view route
                    GoRoute(
                      path: 'edit_profile',
                      redirect: (BuildContext context, GoRouterState state) {
                        if (FirebaseAuth.instance.currentUser == null) {
                          return '/';
                        } else {
                          return null;
                        }
                      },
                      builder: (context, state) => const EditProfile(),
                    ),
                  ]),

              GoRoute(
                  path: 'view_posts',
                  redirect: (BuildContext context, GoRouterState state) {
                    if (FirebaseAuth.instance.currentUser == null) {
                      return '/';
                    } else {
                      return null;
                    }
                  },
                  builder: (context, state) => const FeedPage(),
                  routes: [
                    //option to create post is found within the Feed page route
                    GoRoute(
                      path: 'create_post',
                      redirect: (BuildContext context, GoRouterState state) {
                        if (FirebaseAuth.instance.currentUser == null) {
                          return '/';
                        } else {
                          return null;
                        }
                      },
                      builder: (context, state) => const CreatePost(),
                    ),
                  ]),
            ])
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color maroonColor =  Color.fromARGB(255, 141, 28, 20);
    final MaterialColor customColor = MaterialColor( //creating a maroon Material Color
      maroonColor.value,
      <int, Color>{//various shades
        50: maroonColor,
        100: maroonColor,
        200: maroonColor,
        300: maroonColor,
        400: maroonColor,
        500: maroonColor,
        600: maroonColor,
        700: maroonColor,
        800: maroonColor,
        900: maroonColor,
      },
    );
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(primarySwatch: customColor),
    );
  }
}
