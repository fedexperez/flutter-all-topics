import 'dart:convert';

import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_response.dart';

class PetitionResponseModel extends PetitionResponse {
  const PetitionResponseModel({
    required super.methodType,
    required super.message,
    required super.statusCode,
  });

  factory PetitionResponseModel.fromJson(String str) =>
      PetitionResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetitionResponseModel.fromMap(Map<String, dynamic> json) =>
      PetitionResponseModel(
        methodType: json["methodType"],
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toMap() => {
        "methodType": methodType,
        "message": message,
        "statusCode": statusCode,
      };
}
