import 'package:insight/consts/enums.dart';
import 'package:insight/models/pitch_model.dart';

class UserModel {
  String? name;
  UserStatus? userStatus;
  String? email;
  int? phone;
  List<PitchModel> pitches;

  UserModel({
    this.email,
    this.name,
    this.userStatus,
    this.pitches = const [],
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'userStatus': userStatus.toString(),
        'email': email,
        'phone': phone,
        'pitches': pitches,
      };
}
