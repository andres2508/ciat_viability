import 'package:gg_viability/domain/crop/bean/order/model/order.model.dart';
import 'package:gg_viability/domain/crop/bean/order/type/code/model/order_type_code.model.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';

class BeanOrderService extends HttpDataSource {
  BeanOrderService() : super('/order');

  Future<BeanOrder> findAllForViability() {
    final body = new Map<String, dynamic>();
    body['orderTypeCode'] = [OrderTypeCode.VIABILITY.dbKey];
    return this.post(
        path: 'list',
        body: body,
        itemCreator: (json) => BeanOrder.fromJson(json));
  }
}
