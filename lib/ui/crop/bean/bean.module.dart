import 'package:gg_viability/ui/crop/bean/order/bean_order.list.dart';
import 'package:gg_viability/ui/crop/bean/order/request/order_request.list.dart';
import 'package:gg_viability/ui/platform/ciat.module.dart';
import 'package:gg_viability/ui/platform/router.model.dart';

class BeanModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('beans/pending', (s) => (_) => BeanPendingOrderList()),
      CIATRoute(
          'beans/pending/detail',
          (s) => (_) => OrderRequestListView(
              params: s.arguments as OrderRequestListParams))
    ];
  }
}
