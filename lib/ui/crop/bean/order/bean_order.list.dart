import 'package:flutter/material.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/common/appbar.widget.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/crop/bean/order/bean_order.view.model.dart';
import 'package:gg_viability/ui/crop/bean/order/request/order_request.list.dart';
import 'package:gg_viability/ui/home/drawer.menu.dart';
import 'package:provider/provider.dart';

class BeanPendingOrderList extends StatefulWidget {
  const BeanPendingOrderList({Key? key}) : super(key: key);

  @override
  State<BeanPendingOrderList> createState() => _BeanPendingOrderListState();
}

class _BeanPendingOrderListState extends State<BeanPendingOrderList> {
  final BeanPendingOrderViewModel _model = BeanPendingOrderViewModel();

  @override
  void initState() {
    _model.loadRequired();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BeanPendingOrderViewModel>(
      create: (_) => _model,
      child: Scaffold(
          drawer: const Drawer(
            child: CIATMenuWidget(),
          ),
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
    return ViewModelConsumer<BeanPendingOrderViewModel>(
        builder: (context, model, _) {
      return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        childAspectRatio: 5,
        children: model.orders
            .map((e) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, 'beans/pending/detail',
                      arguments: OrderRequestListParams(e.id)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'CONTRATO ${e.id} (${e.numberOfItems})',
                      style: TextStyle(color: ColorStyles.darkColor),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ))
            .toList(),
      );
    });
  }
}
