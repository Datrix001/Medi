import 'package:medi_app/features/ambience/screens/ambience_screen.dart';

class AmbienceModel {
  final String title;
  final String image;
  final String time;
  final AmbienceType type;

  AmbienceModel({
    required this.title,
    required this.image,
    required this.time,
    required this.type,
  });
}

enum AmbienceType { all, focus, calm, sleep, rest }
