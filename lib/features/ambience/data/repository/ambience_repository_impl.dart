import 'package:medi_app/features/ambience/data/datasources/ambient_localDataSources.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/data/repository/ambience_repository.dart';

class AmbienceRepositoryImpl extends AmbienceRepository {
  final AmbientLocaldatasources localdatasources;

  AmbienceRepositoryImpl({required this.localdatasources});
  @override
  Future<List<AmbienceModel>> getJsonData() async {
    final result = await localdatasources.getData();
    return result;
  }
}
