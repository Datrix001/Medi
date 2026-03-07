import 'package:medi_app/features/journal/data/model/journal_model.dart';

abstract class JournalRepository {
  Future<List<JournalModel>> getJournals();
  Future<void> writeJournal(JournalModel model);
}
