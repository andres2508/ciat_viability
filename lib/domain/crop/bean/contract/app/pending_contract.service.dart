import 'package:gg_viability/domain/crop/bean/contract/model/pending_contract.model.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';

class BeanOrderService extends HttpDataSource {
  BeanOrderService() : super('/order');

  Future<BeanPendingContract> findAll() {
    return this.getItem('list', (json) => BeanPendingContract.fromJson(json));
  }
}
