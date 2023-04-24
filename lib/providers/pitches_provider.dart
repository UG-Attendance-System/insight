import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insight/interfaces/pitches_interface.dart';
import 'package:insight/models/pitch_model.dart';

class PitchesProvider extends PitcheInterface with ChangeNotifier {
  List<PitchModel> _allPitches = [];

  List<PitchModel> get allPitches => _allPitches;

  @override
  Future<void> addPitch(PitchModel pitch) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference pitches =
        FirebaseFirestore.instance.collection('pitches');
    // Call the user's CollectionReference to add a new user
    return pitches
        .add(pitch.toJson())
        .then((value) {})
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future fetchPitches() async {
    try {
      List<PitchModel> pitchesList = [];
      CollectionReference pitches =
          FirebaseFirestore.instance.collection('pitches');
      var querySnapshot = await pitches.get();
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            queryDocumentSnapshot.data() as Map<String, dynamic>;

        pitchesList.add(PitchModel.fromJson(data));
      }
      _allPitches = pitchesList;
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  @override
  PitchModel findById(int id) {
    return allPitches.firstWhere((element) => element.id == id);
  }
}
