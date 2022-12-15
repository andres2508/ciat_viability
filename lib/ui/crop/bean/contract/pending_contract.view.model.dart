import 'package:gg_viability/domain/crop/bean/contract/app/pending_contract.service.dart';
import 'package:gg_viability/domain/crop/bean/contract/model/pending_contract.model.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/common/base.view.model.dart';

class BeanPendingContractViewModel extends BaseViewModel {
  final BeanOrderService _service = serviceLocator<BeanOrderService>();

  List<BeanPendingContractContent> _orders = [];

  List<BeanPendingContractContent> get orders => _orders;

  Future<void> loadRequired() async {
    _orders = (await _service.findAll()).content;
    notifyUI();
    notifyListeners();
  }
}
