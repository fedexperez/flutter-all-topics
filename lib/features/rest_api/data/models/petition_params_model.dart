import 'dart:convert';

import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';

class PetitionParamsModel extends PetitionParams {
  const PetitionParamsModel({
    required super.type,
  });

  factory PetitionParamsModel.fromJson(String str) =>
      PetitionParamsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetitionParamsModel.fromMap(Map<String, dynamic> json) =>
      PetitionParamsModel(
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
      };
}
