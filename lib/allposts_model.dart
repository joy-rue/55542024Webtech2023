// To parse this JSON data, do
//
//     final viewPosts = viewPostsFromJson(jsonString);
//know right que to ask, where you are n where you want to be by undertanding the gneral base 
import 'dart:convert';

ViewPosts viewPostsFromJson(String str) => ViewPosts.fromJson(json.decode(str));

String viewPostsToJson(ViewPosts data) => json.encode(data.toJson());

class ViewPosts {
    ViewPosts({
        required this.posts,
    });

    List<Post> posts;

    factory ViewPosts.fromJson(Map<String, dynamic> json) => ViewPosts(
        posts: List<Post>.from(json["Posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    Post({
        required this.name,
        required this.email,
        required this.message,
        required this.date,
    });

    String name;
    String email;
    String message;
    String date;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        email: json["email"],
        message: json["message"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "message": message,
        "date": date,
    };
}
