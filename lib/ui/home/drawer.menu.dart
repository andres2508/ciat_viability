import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/styles/color.styles.dart';

class CIATMenuWidget extends StatefulWidget {
  const CIATMenuWidget({Key? key}) : super(key: key);

  @override
  State<CIATMenuWidget> createState() => _CIATMenuWidgetState();
}

class _CIATMenuWidgetState extends State<CIATMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userView(),
          ListTile(
            leading: Image.asset(
              'assets/icons/plant.png',
              height: 25,
            ),
            title: Text(
              'Cultivo',
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
            onTap: () => Navigator.pushNamed(context, 'home'),
          ),
          Divider(
            thickness: 2,
          ),
          _menuTitle('Frijol'),
          _optionMenu('Pendientes por recibir', 'beans/pending'),
          _optionMenu('Contratos recibidos', 'home'),
          Divider(
            thickness: 2,
          ),
          _menuTitle('Forrajes'),
          _optionMenu('Pendientes por recibir', 'home'),
          _optionMenu('Contratos recibidos', 'home'),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Cerrar Sesion',
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 2,
          ),
          _menuTitle('Idioma'),
          _optionMenu('Español', 'home'),
          _optionMenu('Ingles', 'home')
        ],
      ),
    );
  }

  Widget _userView() {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      width: double.infinity,
      decoration: BoxDecoration(color: ColorStyles.accentColor),
      child: Column(
        children: [
          Image.asset(
            'assets/icons/user.png',
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              '${CIATSession.currentUser!.name}',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _menuTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }

  Widget _optionMenu(String title, String routeToNavigate) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
      onTap: () => Navigator.pushNamed(context, routeToNavigate),
    );
  }
}
