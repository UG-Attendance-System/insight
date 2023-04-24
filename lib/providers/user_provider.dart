import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insight/consts/enums.dart';
import 'package:insight/models/pitch_model.dart';
import 'package:insight/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends ChangeNotifier {
  final UserModel _userModel = UserModel();

  Future<void> addUser() {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    return users
        .add(user.toJson())
        .then((value) {})
        .catchError((error) => print("Failed to add user: $error"));
  }

  UserModel get user => _userModel;

  List<PitchModel> get myPitches => user.pitches;

  // List<PitchModel> get favPitches => user.favPitches;

  void setUserStatus(UserStatus userStatus) {
    user.userStatus = userStatus;
  }

  void setUser(String name, int phone) {
    final email = FirebaseAuth.instance.currentUser!.email;
    user.email = email;
    user.name = name;
    user.phone = phone;
  }

  addMyPitch(PitchModel pitch) {
    user.pitches.add(pitch);
    notifyListeners();
  }

  // toggleFavPitch(PitchModel pitch) {
  //   if (user.favPitches.contains(pitch)) {
  //     user.favPitches.remove(pitch);
  //   } else {
  //     user.favPitches.add(pitch);
  //   }
  //   notifyListeners();
  // }
}
