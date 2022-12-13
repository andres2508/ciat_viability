import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/common/future_wrapper.widget.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/login/login.view.model.dart';
import 'package:gg_viability/ui/platform/messages/messages.service.dart';
import 'package:gg_viability/ui/user/users.model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _currentUser;
  final MessagesService _messagesService = serviceLocator<MessagesService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<LoginViewModel>(
        builder: (context, model, _) {
          return FutureWrapperWidget(
              future: model.loadUsers,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset( 'assets/logo.png' ),
                    Padding(
                      padding: const EdgeInsets.only( top: 20 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Selecciona un Usuario:'),
                          SizedBox(width: 20),
                          DropdownButton(
                            value: _currentUser,
                            items: _getUserItem(model.users),
                            onChanged: (value) {
                              setState(() {
                                _currentUser = value;
                              });
                            } ,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Iniciar Sesion'),
                      onPressed: (){
                        if ( this._currentUser != null ) {
                          model.setCurrentUser( this._currentUser! );
                          Navigator.pushNamed(context, 'home');
                        } else {
                          _messagesService.fireError( 'No ha seleccionado ningun usuario!' );
                        }
                      }
                    )
                  ],
                );
              }
          );
        }
    );
  }

  List<DropdownMenuItem> _getUserItem(List<User> users) {
    return users.map((e) =>
        DropdownMenuItem(
          value: e.id,
          child: Text(e.name),
        )
    ).toList();
  }
}
