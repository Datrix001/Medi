import 'package:medi_app/features/ambience/data/model/ambience_model.dart';

abstract class AmbienceState {}

class AmbienceInitialState extends AmbienceState {}

class AmbienceLoadingState extends AmbienceState {}

class AmbienceSuccessState extends AmbienceState {
  final List<AmbienceModel> model;

  AmbienceSuccessState({required this.model});
}

class AmbienceFailureState extends AmbienceState {
  final String errorMessage;

  AmbienceFailureState({required this.errorMessage});
}
