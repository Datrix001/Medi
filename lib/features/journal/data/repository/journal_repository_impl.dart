import 'package:medi_app/features/journal/data/datasources/journal_local_dataSources.dart';
import 'package:medi_app/features/journal/data/model/journal_model.dart';
import 'package:medi_app/features/journal/data/repository/journal_repository.dart';

class JournalRepositoryImpl extends JournalRepository {
  final JournalLocalDatasources localDatasources;

  JournalRepositoryImpl({required this.localDatasources});

  @override
  Future<List<JournalModel>> getJournals() async {
    final result = await localDatasources.getJournals();
    return result;
  }

  @override
  Future<void> writeJournal(JournalModel model) async {
    await localDatasources.addJournal(model);
  }
}
