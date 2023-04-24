// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class FireStoreDataBase {
//   List allPosts = [];
//   final CollectionReference collectionRef =
//       FirebaseFirestore.instance.collection("Students");

//    Future getData() async {
//     try {
//       //to get data from a single/particular document alone.
//       // var temp = await collectionRef.doc("<your document ID here>").get();

//       // to get data from all documents sequentially
//       await collectionRef.get().then((querySnapshot) {
//         for (var result in querySnapshot.docs) {
//           allPosts.add(result.data());
//         }
//       });

//       return allPosts;
//     } catch (e) {
//       debugPrint("Error - $e");
//       return e;
//     }
//   }
// }

// FutureBuilder posts = FutureBuilder(
//       future: FireStoreDataBase().getData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text(
//             "Something went wrong",
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//             var dataList = snapshot.data as List;
//             return buildItems(dataList);
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//       ),