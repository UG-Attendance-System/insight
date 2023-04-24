import 'package:insight/models/pitch_model.dart';

abstract class PitcheInterface {
  Future fetchPitches();
  Future addPitch(PitchModel pitch);
  PitchModel findById(int id);
}
