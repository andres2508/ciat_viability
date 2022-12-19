import 'package:flutter/material.dart';
import 'package:gg_viability/domain/crop/bean/order/request/model/order_request.model.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/common/future_wrapper.widget.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/crop/bean/order/request/order_request.view.model.dart';
import 'package:gg_viability/ui/home/appbar.widget.dart';
import 'package:gg_viability/ui/platform/messages/messages.service.dart';
import 'package:provider/provider.dart';

class OrderRequestListParams {
  int orderId;

  OrderRequestListParams(this.orderId);
}

class OrderRequestListView extends StatefulWidget {
  final OrderRequestListParams params;

  const OrderRequestListView({required this.params, Key? key})
      : super(key: key);

  @override
  State<OrderRequestListView> createState() => _OrderRequestListViewState();
}

class _OrderRequestListViewState extends State<OrderRequestListView> {
  final OrderRequestViewModel _model = OrderRequestViewModel();
  final MessagesService _messagesService = serviceLocator<MessagesService>();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderRequestViewModel>(
      create: (_) => _model,
      child: Scaffold(
        appBar: CIATAppBarWidget(
            title:
                'Frijol - Contratos para recibir - ${widget.params.orderId}'),
        body: Column(
          children: [
            _header(),
            Expanded(
                child: FutureWrapperWidget(
                    future: () => _model.loadRequired(widget.params.orderId),
                    builder: (_, snapshot) => _accessionList()))
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return ViewModelConsumer<OrderRequestViewModel>(
        builder: (context, model, _) {
      return Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('TOTAL ITEMS: ${model.items.length}'),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Text('INVENTARIO:'),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        focusNode: _focusNode,
                        onChanged: (e) => model.search(e),
                        onFieldSubmitted: (inventoryNumber) {
                          if (inventoryNumber != null &&
                              inventoryNumber != '') {
                            try {
                              final found =
                                  model.findInventory(inventoryNumber);
                              found.confirm();
                            } catch (e) {
                              _messagesService.fireError(
                                  'No se encontro el inventario: $inventoryNumber');
                            } finally {
                              _formKey.currentState!.reset();
                              model.reset();
                              _focusNode.requestFocus();
                            }
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('FINALIZAR'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _accessionList() {
    return ViewModelConsumer<OrderRequestViewModel>(
      builder: (context, model, _) {
        if (model.items.isEmpty) {
          return Center(
              child: Text(
                  'No existen ordenes asociadas con el valor solicitado.'));
        }
        return GridView.count(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2.7,
          crossAxisCount: 4,
          children: model.items.map((e) => _accessionDetail(e)).toList(),
        );
      },
    );
  }

  Widget _accessionDetail(OrderRequestItem item) {
    return GestureDetector(
      onTap: () => setState(() {
        if (!item.confirmed) {
          item.confirm();
          _snackBarMessage(
              'Confirmado el item: ${item.inventory.inventoryNumberPart1}');
        } else {
          item.unconfirm();
          _snackBarMessage(
              'Desconfirmado el item: ${item.inventory.inventoryNumberPart1}');
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: !item.confirmed ? ColorStyles.darkColor : Colors.black54,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _accessionText('${item.inventory.accession.id}'),
            _accessionText('${item.inventory.accession.preferredName}'),
            _accessionText('${item.inventory.inventoryNumberPart1}')
          ],
        ),
      ),
    );
  }

  Widget _accessionText(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.white),
    );
  }

  void _snackBarMessage(String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(message.toUpperCase())
        ],
      ),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
