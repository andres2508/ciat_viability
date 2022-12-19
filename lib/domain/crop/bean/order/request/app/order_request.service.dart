import 'package:gg_viability/domain/crop/bean/order/request/model/order_request.model.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';

class BeanOrderRequestService extends HttpDataSource {
  BeanOrderRequestService() : super('/order/items');

  Future<OrderRequest> findAllByOrder(int orderId) {
    final filter = new Map<String, dynamic>();
    filter['orderRequest'] = List<int>.of([orderId]);
    return this.post(
        path: 'list',
        body: filter,
        itemCreator: (json) => OrderRequest.fromJson(json));
  }
}
