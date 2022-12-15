import 'package:gg_viability/ui/crop/bean/contract/pending_contract.list.dart';
import 'package:gg_viability/ui/platform/ciat.module.dart';
import 'package:gg_viability/ui/platform/router.model.dart';

class BeanModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('beans/pending', (s) => (_) => BeanPendingContractList())
    ];
  }
}
