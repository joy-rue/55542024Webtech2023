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
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// WidgetsFlutterBinding.ensureInitialized();
//   await AuthService.firebase().initialize();
//   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomeScreen(),
      routes: <GoRoute>[
        GoRoute(
          path: 'login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
            path: 'sign_up',
            builder: (context, state) => const SignUp(),
            routes: <GoRoute>[
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
        GoRoute(
            path: 'homepage',
            redirect: (BuildContext context, GoRouterState state) {
              if (FirebaseAuth.instance.currentUser == null) {
                return '/';
              } else {
                return null;
              }
            },
            builder: (context, state) => const HomePage(),
            routes: <GoRoute>[
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
    final Color maroonColor = Color.fromARGB(255, 141, 28, 20);
    final MaterialColor customColor = MaterialColor(
      maroonColor.value,
      <int, Color>{
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
