import 'package:json_annotation/json_annotation.dart';

part 'pending_contract.model.g.dart';

@JsonSerializable()
class BeanPendingContract {
  List<BeanPendingContractContent> content;

  BeanPendingContract(this.content);

  Map<String, dynamic> toJson() => _$BeanPendingContractToJson(this);

  factory BeanPendingContract.fromJson(Map<String, dynamic> json) =>
      _$BeanPendingContractFromJson(json);
}

@JsonSerializable()
class BeanPendingContractContent {
  int id;
  String localNumber;
  String intendedUseCode;
  int numberOfItems;

  BeanPendingContractContent(
      this.id, this.localNumber, this.intendedUseCode, this.numberOfItems);

  Map<String, dynamic> toJson() => _$BeanPendingContractContentToJson(this);

  factory BeanPendingContractContent.fromJson(Map<String, dynamic> json) =>
      _$BeanPendingContractContentFromJson(json);
}
