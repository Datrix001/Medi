import 'package:json_annotation/json_annotation.dart';

part 'ambience_model.g.dart';

@JsonSerializable()
class AmbienceModel {
  @JsonKey(name: 'ambience_id')
  final int? ambienceId;

  final String title;
  final AmbienceType type;
  final String time;

  @JsonKey(name: 'images')
  final String image;

  AmbienceModel({
    this.ambienceId,
    required this.title,
    required this.type,
    required this.time,
    required this.image,
  });

  factory AmbienceModel.fromJson(Map<String, dynamic> json) =>
      _$AmbienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmbienceModelToJson(this);
}

enum AmbienceType {
  @JsonValue('All')
  all,

  @JsonValue('Focus')
  focus,

  @JsonValue('Calm')
  calm,

  @JsonValue('Sleep')
  sleep,

  @JsonValue('Reset')
  rest,
}
