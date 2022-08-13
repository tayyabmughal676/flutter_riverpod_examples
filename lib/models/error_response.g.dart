// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      validateErrors: (json['validate_errors'] as List<dynamic>?)
          ?.map((e) => ValidateErrors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'validate_errors': instance.validateErrors,
    };

ValidateErrors _$ValidateErrorsFromJson(Map<String, dynamic> json) =>
    ValidateErrors(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ValidateErrorsToJson(ValidateErrors instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
