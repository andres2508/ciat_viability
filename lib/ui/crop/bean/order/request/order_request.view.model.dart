import 'package:gg_viability/domain/crop/bean/order/request/app/order_request.service.dart';
import 'package:gg_viability/domain/crop/bean/order/request/model/order_request.model.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/common/base.view.model.dart';

class OrderRequestViewModel extends BaseViewModel {
  final BeanOrderRequestService _service =
      serviceLocator<BeanOrderRequestService>();

  List<OrderRequestItem> _items = [];
  List<OrderRequestItem> _filtered = [];

  List<OrderRequestItem> get items => _filtered;

  Future<void> loadRequired(int orderId) async {
    _items = (await _service.findAllByOrder(orderId)).content;
    _items.forEach((element) => _filtered.add(element));
    notifyUI();
    notifyListeners();
  }

  void search(String? inventoryNumber) {
    _filtered = [];
    for (var value in _items) {
      if ('${value.inventory.inventoryNumberPart1}'
          .contains(inventoryNumber.toString())) {
        _filtered.add(value);
      }
    }
    notifyUI();
    notifyListeners();
  }

  void reset() {
    _filtered = [];
    _items.forEach((it) => _filtered.add(it));
    notifyUI();
    notifyListeners();
  }

  OrderRequestItem findInventory(String inventoryNumber) {
    return _items.firstWhere(
        (it) => it.inventory.inventoryNumberPart1 == inventoryNumber);
  }
}
