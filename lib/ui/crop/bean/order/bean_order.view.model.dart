import 'package:gg_viability/domain/crop/bean/order/app/order.service.dart';
import 'package:gg_viability/domain/crop/bean/order/model/order.model.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/common/base.view.model.dart';

class BeanPendingOrderViewModel extends BaseViewModel {
  final BeanOrderService _service = serviceLocator<BeanOrderService>();

  List<BeanOrderContent> _orders = [];

  List<BeanOrderContent> get orders => _orders;

  Future<void> loadRequired() async {
    _orders = (await _service.findAll()).content;
    notifyUI();
    notifyListeners();
  }
}
