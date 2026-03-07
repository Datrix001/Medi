// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalModel _$JournalModelFromJson(Map<String, dynamic> json) => JournalModel(
  title: json['title'] as String,
  date: json['date'] as String,
  feelingType: $enumDecode(_$FeelingsTypeEnumMap, json['feelingType']),
  feeling: json['feeling'] as String,
);

Map<String, dynamic> _$JournalModelToJson(JournalModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date,
      'feelingType': _$FeelingsTypeEnumMap[instance.feelingType]!,
      'feeling': instance.feeling,
    };

const _$FeelingsTypeEnumMap = {
  FeelingsType.calm: 'calm',
  FeelingsType.grounded: 'grounded',
  FeelingsType.energized: 'energized',
  FeelingsType.sleepy: 'sleepy',
};
