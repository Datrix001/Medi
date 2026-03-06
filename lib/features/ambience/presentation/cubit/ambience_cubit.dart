import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/ambience/data/repository/ambience_repository.dart';
import 'package:medi_app/features/ambience/presentation/cubit/ambience_state.dart';

class AmbienceCubit extends Cubit<AmbienceState> {
  final AmbienceRepository repository;

  AmbienceCubit({required this.repository}) : super(AmbienceInitialState());

  Future<void> getData() async {
    try {
      final result = await repository.getJsonData();
      emit(AmbienceSuccessState(model: result));
    } catch (e) {
      emit(AmbienceFailureState(errorMessage: e.toString()));
    }
  }
}
