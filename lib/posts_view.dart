import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webtech_flutter_app/api_service.dart';
import 'package:intl/intl.dart';

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
      //asynchronously obtain all posts from api and display
      body: FutureBuilder(
          future: ApiService()
              .viewAllPosts(), 
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
              case ConnectionState.active:
              case ConnectionState.waiting:
                if (snapshot.hasData) {
                  //convert the string to date time to enable sorting 
                  snapshot.data!.sort((a, b) => DateTime.parse(b['date'])
                      .compareTo(DateTime.parse(a['date'])));
                  
                  return Container(
                    //background or wall papaer
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/wallpaper.png"),
                      fit: BoxFit.cover,
                    )),
                    //after posts are arranged, display one after the other as cards
                    child: ListView.builder(
                      itemCount: snapshot.data!.length, //to determine the number of cards to be built
                      itemBuilder: (BuildContext context, int index) {
                        //index tracks the item number out of the total itemCount
                        //obtain the post data @ index index and display
                        Map<String, dynamic> post = snapshot.data![index];
                        bool isMyPost = post['email'] ==
                            FirebaseAuth.instance.currentUser!
                                .email;  //if the post email matches the current post to be displayed 
                        return Card(
                          elevation: 2.0,
                          margin: EdgeInsets.only(
                            top: 16.0,
                            bottom:
                                index == snapshot.data!.length - 1 ? 12.0 : 0.0,
                                //all user posts appear to the right when they are logged in
                            left: isMyPost ? 80.0 : 0.0,
                            right: isMyPost ? 0.0 : 80.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(//all the details of the post align to the beginining 
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['email'],
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0, width: 16.0),
                                Text(
                                  post['message'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0, width: 16.0),
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
          //navigate to create_post for user to send message
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/homepage/view_posts/create_post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
