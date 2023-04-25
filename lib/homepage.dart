import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/profile_view.dart';
import 'package:webtech_flutter_app/posts_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 22, 52),
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text('Posts'),
              hoverColor: const Color.fromARGB(255, 122, 77, 87),
              onTap: () {
                GoRouter.of(context).go('/view_posts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              hoverColor: const Color.fromARGB(255, 122, 77, 87),
              onTap: () {
                GoRouter.of(context).go('/view_profile');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          flexibleSpace: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.4, color: Color.fromARGB(255, 141, 28, 20))),
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.png'),
              repeat: ImageRepeat.repeatX,
            ),
          ),
          child: const Center(
            child: Text(
              'Ashesi Social Space',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/student.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Welcome to Ashesi Social Space!',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              shadows: [
                Shadow(
                    offset: Offset.zero,
                    color: Color.fromARGB(255, 141, 28, 20))
              ],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
