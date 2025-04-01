// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoaDto _$DoaDtoFromJson(Map<String, dynamic> json) => DoaDto(
      title: json['title'] as String,
      arabic: json['arabic'] as String,
      latin: json['latin'] as String,
      translation: json['translation'] as String,
    );

Map<String, dynamic> _$DoaDtoToJson(DoaDto instance) => <String, dynamic>{
      'title': instance.title,
      'arabic': instance.arabic,
      'latin': instance.latin,
      'translation': instance.translation,
    };
