import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/common/appbar.widget.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/login/login.view.model.dart';
import 'package:gg_viability/ui/platform/dialog/dialogs.service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final DialogsService _messagesService = serviceLocator<DialogsService>();
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<LoginViewModel>(builder: (context, model, _) {
      return Scaffold(
        appBar: CIATAppBarWidget(
          title: 'Es una prueba',
          isLoginView: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/complete_logo_ciat.png',
                  width: 700,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Usuario:'),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                                width: 200,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'usuario'),
                                  onSaved: (value) => this._username = value!,
                                  validator: (value) =>
                                      value == null || value == ''
                                          ? 'Ingrese el usuario'
                                          : null,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Contraseña:'),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: 200,
                                child: TextFormField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                      hintText: 'contraseña'),
                                  onSaved: (value) => this._password = value!,
                                  validator: (value) =>
                                      value == null || value == ''
                                          ? 'Ingrese la contraseña'
                                          : null,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      child: Text('INGRESAR'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          this._formKey.currentState!.save();
                          _submit(model);
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Si tiene problemas al iniciar sesion contactar a IT PRG"
                        .toUpperCase(),
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> _submit(LoginViewModel model) async {
    final snackBar = SnackBar(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text("¡Iniciando sesion!")
        ],
      ),
      duration: Duration(seconds: 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    _messagesService.changeContext(context);
    model.login(_username, _password, context);
  }
}
