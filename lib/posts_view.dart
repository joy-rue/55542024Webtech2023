import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/api_service.dart';

import 'create_post.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: FutureBuilder(
          future: ApiService()
              .viewAllPosts(), // a previously-obtained Future<String> or null
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
              case ConnectionState.active:
              case ConnectionState.waiting:
                if (snapshot.hasData) {
                  var user = snapshot.data!;
                  print(snapshot.data![
                      0]); //snapshot.data contains values name, message etc not the list
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/wallpaper.png"),
                        fit: BoxFit.cover,
                      )
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> post = snapshot.data![index];
                        bool isMyPost = post['email'] ==
                            'ruvimbo.sithole@ashesi.edu.gh'; // Replace with the logged in user's email.
                        return Card(
                          elevation: 2.0,
                          margin: EdgeInsets.only(
                            top: 16.0,
                            bottom:
                                index == snapshot.data!.length - 1 ? 12.0 : 0.0,
                            left: isMyPost ? 80.0 : 0.0,
                            right: isMyPost ? 0.0 : 80.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['email'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  post['message'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  post['date'].toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Column(
                    children: const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              default:
                return Column(
                  children: const [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePost(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
