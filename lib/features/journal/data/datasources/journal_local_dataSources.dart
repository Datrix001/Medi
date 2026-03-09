import 'package:hive/hive.dart';
import 'package:medi_app/features/journal/data/model/journal_model.dart';

class JournalLocalDatasources {
  final Box box = Hive.box('journalBox');

  Future<List<JournalModel>> getJournals() async {
    try {
      return box.values
          .map((e) => JournalModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> addJournal(JournalModel journal) async {
    try {
      await box.add(journal.toJson());
    } catch (e) {
      throw e.toString();
    }
  }
}
