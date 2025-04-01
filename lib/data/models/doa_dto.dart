import 'package:json_annotation/json_annotation.dart';

part 'doa_dto.g.dart';

@JsonSerializable()
class DoaDto {
  String title;
  String arabic;
  String latin;
  String translation;

  DoaDto({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory DoaDto.fromJson(Map<String, dynamic> json) => _$DoaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DoaDtoToJson(this);
}
