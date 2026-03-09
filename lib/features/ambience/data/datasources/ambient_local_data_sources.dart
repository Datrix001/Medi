import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';

class AmbientLocaldatasources {
  Future<List<AmbienceModel>> getData() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/ambience_data.json',
      );

      final List decoded = jsonDecode(jsonString);

      return decoded.map((e) => AmbienceModel.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
