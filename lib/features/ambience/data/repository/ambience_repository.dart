import 'package:medi_app/features/ambience/data/model/ambience_model.dart';

abstract class AmbienceRepository {
  Future<List<AmbienceModel>> getJsonData();
}
