import 'package:gg_viability/domain/inventory/model/inventory.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_request.model.g.dart';

@JsonSerializable()
class OrderRequest {
  List<OrderRequestItem> content;

  OrderRequest(this.content);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as List<dynamic>;
    final result = [];
    for (var item in content) {
      try {
        result.add(OrderRequestItem.fromJson(item as Map<String, dynamic>));
      } catch (e) {
        final itemMap = item as Map<String, dynamic>;
        final accessionToFound = itemMap['inventory']['accession'] as int;
        print('Accession to found: $accessionToFound');
        final requestItemFound = result
            .firstWhere((it) => it.inventory.accession.id == accessionToFound);
        item['inventory']['accession'] =
            requestItemFound.inventory.accession.toJson();
        result.add(OrderRequestItem.fromJson(item as Map<String, dynamic>));
      }
    }
    return OrderRequest(List<OrderRequestItem>.from(result));
  }
}

@JsonSerializable()
class OrderRequestItem {
  int id;
  double? quantityShipped;
  int orderRequestId;
  Inventory inventory;
  @JsonKey(defaultValue: false)
  bool confirmed;

  OrderRequestItem(this.id, this.quantityShipped, this.orderRequestId,
      this.inventory, this.confirmed);

  Map<String, dynamic> toJson() => _$OrderRequestItemToJson(this);

  factory OrderRequestItem.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestItemFromJson(json);

  void confirm() {
    this.confirmed = true;
  }

  void unconfirm() {
    this.confirmed = false;
  }
}
