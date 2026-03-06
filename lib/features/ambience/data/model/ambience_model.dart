import 'package:json_annotation/json_annotation.dart';

part 'ambience_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AmbienceModel {
  final int? ambienceId;

  final String title;
  final AmbienceType type;
  final String time;

  @JsonKey(name: 'images')
  final String image;

  final AmbienceDetails ambienceDetails;

  AmbienceModel({
    this.ambienceId,
    required this.title,
    required this.type,
    required this.time,
    required this.image,
    required this.ambienceDetails,
  });

  factory AmbienceModel.fromJson(Map<String, dynamic> json) =>
      _$AmbienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmbienceModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AmbienceDetails {
  final String details;
  final List<String> sensoryElements;

  AmbienceDetails({required this.details, required this.sensoryElements});

  factory AmbienceDetails.fromJson(Map<String, dynamic> json) =>
      _$AmbienceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AmbienceDetailsToJson(this);
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

// enum SensoryType {
//   @JsonValue('Warm Light')
//   warmLight,

//   @JsonValue('Soft Rain')
//   softRain,

//   @JsonValue('Binarual')
//   binaural,

//   @JsonValue('Mist')
//   mist,
// }
