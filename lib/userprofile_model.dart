// To parse this JSON data, do
//
//     final createProfile = createProfileFromJson(jsonString);

import 'dart:convert';


ProfileModel ProfileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.name,
        required this.id,
        required this.email,
        required this.major,
        required this.year,
        required this.dob,
        required this.food,
        required this.movie,
    });

    String name;
    String id;
    String email;
    String major;
    String year;
    String dob;
    String food;
    String movie;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        id: json["id"],
        email: json["email"],
        major: json["major"],
        year: json["year"],
        dob: json["dob"],
        food: json["food"],
        movie: json["movie"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
        "major": major,
        "year": year,
        "dob": dob,
        "food": food,
        "movie": movie,
    };
}
