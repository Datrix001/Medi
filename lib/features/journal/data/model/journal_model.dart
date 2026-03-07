import 'package:json_annotation/json_annotation.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';

part 'journal_model.g.dart';

@JsonSerializable()
class JournalModel {
  final String title;
  final String date;
  final FeelingsType feelingType;
  final String feeling;

  JournalModel({
    required this.title,
    required this.date,
    required this.feelingType,
    required this.feeling,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) =>
      _$JournalModelFromJson(json);
  Map<String, dynamic> toJson() => _$JournalModelToJson(this);
}
