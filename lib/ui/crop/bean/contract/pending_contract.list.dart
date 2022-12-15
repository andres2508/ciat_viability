import 'package:flutter/material.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/crop/bean/contract/pending_contract.view.model.dart';
import 'package:gg_viability/ui/home/appbar.widget.dart';
import 'package:provider/provider.dart';

class BeanPendingContractList extends StatefulWidget {
  const BeanPendingContractList({Key? key}) : super(key: key);

  @override
  State<BeanPendingContractList> createState() =>
      _BeanPendingContractListState();
}

class _BeanPendingContractListState extends State<BeanPendingContractList> {
  final BeanPendingContractViewModel _model = BeanPendingContractViewModel();

  @override
  void initState() {
    _model.loadRequired();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BeanPendingContractViewModel>(
      create: (_) => _model,
      child: Scaffold(
          appBar: CIATAppBarWidget(title: 'Frijol Contratos para recibir'),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(color: ColorStyles.darkColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Pendientes por recibir',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Expanded(
                          child: _orderList(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _orderList() {
    return ViewModelConsumer<BeanPendingContractViewModel>(
        builder: (context, model, _) {
      return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        childAspectRatio: 5,
        children: model.orders
            .map((e) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'CONTRATO ${e.id} (${e.numberOfItems})',
                    style: TextStyle(color: ColorStyles.darkColor),
                    textAlign: TextAlign.center,
                  )),
                ))
            .toList(),
      );
    });
  }
}
