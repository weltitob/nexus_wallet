// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

//for clean code move all code that pushes something into a repository in firebase goes in this folder
//https://www.youtube.com/watch?v=CCPtzJH9_YA&t=962s&ab_channel=TheFlutterFairy

class UserRepository {
  final _authService = AuthenicationService.instance;
  final usersCollection = FirebaseFirestore.instance.collection("users");

  ValueNotifier<User?> currentUserNotifier = ValueNotifier<User?>(null);
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userStreamSubscriptions;
  StreamSubscription? _authStreamSubscription;
  String? get currentUserUID => _authService.auth.currentUser?.uid;

  set setCurrentUser(User? user) {
    currentUserNotifier.value = user;
    currentUserNotifier.notifyListeners();
  }

  UserRepository() {
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authStreamSubscription?.cancel();
    _authStreamSubscription = null;

    _authStreamSubscription = _authService.authStates().listen((firebaseUser) {
      if (firebaseUser != null) {
        final String uid = firebaseUser.uid;
        getCurrentUser(uid);
        errorPrint("CURRENT USER -> $uid");
      } else {
        errorPrint("NO CURRENT USER");
      }
    });
  }

  Future<Either<ErrorHandler, User>> registerUser(User user) async {
    try {
      //Generate codes for new users

      //authenticate the user
      final firebaseUser = await _authService.authFirebase(user.customToken);

      if (firebaseUser != null) {
        //firebaseUser.uid should be did of user because of cloud function call which creates custom Token with did
        final newUser = user.copyWith(did: firebaseUser.uid);

        await usersCollection.doc(firebaseUser.uid).set(newUser.toMap());
        print('created user in firebase database');
        await getCurrentUser(firebaseUser.uid);
        return Right(user);
      }

      return const Left(ErrorHandler(message: "Could'nt register user"));
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  // Future<User> getCurrentUser(String uid) async {
  //   final userSnapshot = await usersCollection.doc(uid).get();
  //   if (userSnapshot.exists) {
  //     final data = userSnapshot.data() as Map<String, dynamic>;
  //     final User user = User.fromMap(data);
  //     setCurrentUser = user;
  //
  //     listenToCurrentUser(user.did);
  //     return user;
  //   }
  // }

  Future<Either<ErrorHandler, User>> getCurrentUser(String uid) async {
    try {
      final userSnapshot = await usersCollection.doc(uid).get();
      if (userSnapshot.exists) {
        final data = userSnapshot.data() as Map<String, dynamic>;
        final User user = User.fromMap(data);
        setCurrentUser = user;

        listenToCurrentUser(user.did);
        return Right(user);
      } else {
        return const Left(ErrorHandler(message: "User does not exist"));
      }
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  Future<Either<ErrorHandler, User>> login(String email, String password) async {
    try {
      final firebaseUser = await _authService.logIn(email, password);

      if (firebaseUser != null) {
        final getCurrentUserData = await getCurrentUser(firebaseUser.uid);
        if (getCurrentUserData.isRight) {
          return Right(getCurrentUserData.right);
        } else {
          return Left(getCurrentUserData.left);
        }
      }
      return const Left(ErrorHandler(message: "Could'nt login user"));
    } catch (e) {
      return Left(ErrorHandler(message: e.toString()));
    }
  }

  Stream<User?> listenToCurrentUser(String uid) async* {
    try {
      final snapshots = usersCollection.doc(uid).snapshots();
      _userStreamSubscriptions?.cancel();
      _userStreamSubscriptions = null;
      _userStreamSubscriptions = snapshots.listen((document) {
        if (document.exists) {
          final data = document.data() as Map<String, dynamic>;
          final user = User.fromMap(data);
          setCurrentUser = user;
        }
      });
    } catch (e) {
      errorPrint(e);
    }

    yield currentUserNotifier.value;
  }

  Future<void> logout() async {
    setCurrentUser = null;
    await _authService.logout();
  }

}