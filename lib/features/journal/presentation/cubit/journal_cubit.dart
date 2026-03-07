import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_app/features/journal/data/model/journal_model.dart';
import 'package:medi_app/features/journal/data/repository/journal_repository.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  final JournalRepository journalRepository;

  JournalCubit({required this.journalRepository})
    : super(JournalInitialState());

  Future<void> getData() async {
    emit(JournalLoadingState());

    try {
      final result = await journalRepository.getJournals();
      emit(JournalSuccessState(model: result));
    } catch (e) {
      emit(JournalFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> writeData(JournalModel model) async {
    emit(JournalLoadingState());

    try {
      await journalRepository.writeJournal(model);
      emit(JournalWrittenSuccessState());
    } catch (e) {
      emit(JournalFailureState(errorMessage: e.toString()));
    }
  }
}
