import 'package:gg_viability/domain/crop/bean/order/model/order.model.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';

class BeanOrderService extends HttpDataSource {
  BeanOrderService() : super('/order');

  Future<BeanOrder> findAll() {
    return this.getItem('list', (json) => BeanOrder.fromJson(json));
  }
}
