import 'package:medi_app/features/journal/data/model/journal_model.dart';

abstract class JournalState {}

class JournalInitialState extends JournalState {}

class JournalLoadingState extends JournalState {}

class JournalSuccessState extends JournalState {
  final List<JournalModel> model;

  JournalSuccessState({required this.model});
}

class JournalWrittenSuccessState extends JournalState {}

class JournalFailureState extends JournalState {
  final String errorMessage;

  JournalFailureState({required this.errorMessage});
}
