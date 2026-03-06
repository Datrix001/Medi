// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ambience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmbienceModel _$AmbienceModelFromJson(Map<String, dynamic> json) =>
    AmbienceModel(
      ambienceId: (json['ambience_id'] as num?)?.toInt(),
      title: json['title'] as String,
      type: $enumDecode(_$AmbienceTypeEnumMap, json['type']),
      time: json['time'] as String,
      image: json['images'] as String,
    );

Map<String, dynamic> _$AmbienceModelToJson(AmbienceModel instance) =>
    <String, dynamic>{
      'ambience_id': instance.ambienceId,
      'title': instance.title,
      'type': _$AmbienceTypeEnumMap[instance.type]!,
      'time': instance.time,
      'images': instance.image,
    };

const _$AmbienceTypeEnumMap = {
  AmbienceType.all: 'All',
  AmbienceType.focus: 'Focus',
  AmbienceType.calm: 'Calm',
  AmbienceType.sleep: 'Sleep',
  AmbienceType.rest: 'Reset',
};
