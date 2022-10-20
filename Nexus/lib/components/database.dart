import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final CollectionReference usersRef =  FirebaseFirestore.instance.collection('users');
final storageRef = FirebaseStorage.instance.ref();
final postsRef = FirebaseFirestore.instance.collection('posts');
final postsRef2 = FirebaseFirestore.instance.collection('posts2');
final commentsRef = FirebaseFirestore.instance.collection('comments');
final activityFeedRef = FirebaseFirestore.instance.collection('feed');
final followersRef = FirebaseFirestore.instance.collection('followers');
final followingRef = FirebaseFirestore.instance.collection('following');
final timelineRef = FirebaseFirestore.instance.collection('timeline');
//auth verification codes
final codesRef = FirebaseFirestore.instance.collection('codes');
final settingsRef = FirebaseFirestore.instance.collection('settings');

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  Future updateUserData(
      String username,
      dynamic email,
      dynamic photoUrl,
      dynamic displayName,
      dynamic timestamp) async {
    return await usersRef.doc(uid).set({
      'id': uid,
      'username': username,
      'photoUrl': photoUrl,
      'email': email,
      'displayName': displayName,
      'bio': '',
      'timestamp': timestamp,
    });
  }

  // user data from snapshots
  // UserData _userDataFromSnapshot(DocumentSnapshot doc) {
  //   return UserData(
  //       id: doc['id'],
  //       username: doc['username'],
  //       email: doc['email'],
  //       photoUrl: doc['photoUrl'],
  //       displayName: doc['displayName'],
  //       bio: doc['bio']);
  // }

  // get user doc stream
//   Stream<UserData> get userData {
//     return usersRef.doc(uid).snapshots()
//         .map(_userDataFromSnapshot);
//   }
}