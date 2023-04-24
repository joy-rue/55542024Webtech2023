// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/create_profile.dart';
// import 'package:webtech_flutter_app/edit_profile.dart';
// import 'package:webtech_flutter_app/profile_view.dart';
// import 'package:webtech_flutter_app/create_post.dart';
// import 'package:webtech_flutter_app/posts_view.dart';
// import 'package:webtech_flutter_app/homepage.dart';

// class RouteGenrator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//  switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const AuthWrapper());
//       case '/home':
//         return MaterialPageRoute(builder: (_) => const HomePage());
//       case '/login':
//         return MaterialPageRoute(builder: (_) => const LoginPage());
//       case '/createprof':
//         return MaterialPageRoute(builder: (_) => CreateProfile());
//       case '/createpost':
//         return MaterialPageRoute(builder: (_) => CreatePost());
//       case '/editprof':
//         return MaterialPageRoute(builder: (_) => EditProfile());
//       case '/viewprof':
//         return MaterialPageRoute(builder: (_) => ProfileView());
//       case '/viewposts':
//         return MaterialPageRoute(builder: (_) => PostsView(args));
//       // case '/signup':
//       // return MaterialPageRoute(builder: (_) => SignUpPage());
//       // your next rounting should be here
//     }

//     return MaterialPageRoute(builder: (_) => const LoginPage());
//   }
// }
