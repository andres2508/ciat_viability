import 'package:gg_viability/domain/accession/model/accession.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory.model.g.dart';

@JsonSerializable()
class Inventory {
  int id;
  String inventoryNumberPart1;
  Accession accession;

  Inventory(this.id, this.inventoryNumberPart1, this.accession);

  Map<String, dynamic> toJson() => _$InventoryToJson(this);

  factory Inventory.fromJson(Map<String, dynamic> json) =>
      _$InventoryFromJson(json);
}
