

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Your web app's Firebase configuration
final firebaseConfig = Firebase.initializeApp(
options: FirebaseOptions(
apiKey: "",
authDomain: "",
projectId: "social-space-1",
storageBucket: "",
messagingSenderId: "",
appId: "",
),
);

// Initialize Firestore
final firestoreInstance = FirebaseFirestore.instance;



