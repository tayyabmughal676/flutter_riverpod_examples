import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  String? message;
  int? code;
  Data? data;

  ErrorResponse({
    this.message,
    this.code,
    this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'validate_errors')
  List<ValidateErrors>? validateErrors;

  Data({
    this.validateErrors,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ValidateErrors {
  String? email;

  ValidateErrors({
    this.email,
  });

  factory ValidateErrors.fromJson(Map<String, dynamic> json) =>
      _$ValidateErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateErrorsToJson(this);
}
