import 'package:get_it/get_it.dart';
import 'package:gg_viability/domain/crop/bean/order/app/order.service.dart';
import 'package:gg_viability/domain/crop/bean/order/request/app/order_request.service.dart';
import 'package:gg_viability/infrastructure/auth/basic_auth.service.dart';
import 'package:gg_viability/ui/platform/dialog/dialogs.service.dart';
import 'package:gg_viability/ui/platform/messages/messages.service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Infrastructure Services
  serviceLocator.registerSingleton(MessagesService());
  serviceLocator.registerSingleton(DialogsService());
  serviceLocator.registerSingleton(BasicAuthService());
  // Domain Services
  serviceLocator.registerSingleton(BeanOrderService());
  serviceLocator.registerSingleton(BeanOrderRequestService());
}
