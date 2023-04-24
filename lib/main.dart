import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/create_profile.dart';
import 'package:webtech_flutter_app/homepage.dart';

import 'api_service.dart';

void main()
  // WidgetFlutterBinding.ensureInitialized{6;}
    =>
    runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'create_profile',
          builder: (context, state) => const CreateProfile(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
