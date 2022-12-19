import 'package:json_annotation/json_annotation.dart';

part 'accession.model.g.dart';

@JsonSerializable()
class Accession {
  int id;
  String accessionNumber;
  String preferredName;

  Accession(this.id, this.accessionNumber, this.preferredName);

  Map<String, dynamic> toJson() => _$AccessionToJson(this);

  factory Accession.fromJson(Map<String, dynamic> json) =>
      _$AccessionFromJson(json);
}
