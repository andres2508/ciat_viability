import 'package:json_annotation/json_annotation.dart';

part 'order.model.g.dart';

@JsonSerializable()
class BeanOrder {
  List<BeanOrderContent> content;

  BeanOrder(this.content);

  Map<String, dynamic> toJson() => _$BeanOrderToJson(this);

  factory BeanOrder.fromJson(Map<String, dynamic> json) =>
      _$BeanOrderFromJson(json);
}

@JsonSerializable()
class BeanOrderContent {
  int id;
  String localNumber;
  String intendedUseCode;
  int numberOfItems;

  BeanOrderContent(
      this.id, this.localNumber, this.intendedUseCode, this.numberOfItems);

  Map<String, dynamic> toJson() => _$BeanOrderContentToJson(this);

  factory BeanOrderContent.fromJson(Map<String, dynamic> json) =>
      _$BeanOrderContentFromJson(json);
}
