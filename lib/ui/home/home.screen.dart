import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/styles/color.styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido: ${CIATSession.currentUser!.name}"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _optionWidget( 'Envio de Bandejas', () => Navigator.pushNamed(context, 'accession/trays' ) ),
                SizedBox( width: 30 ),
                _optionWidget( 'Recepcion de Bandejas', () => Navigator.pushNamed(context, 'accession/shippings' )  ),
                SizedBox( width: 30 ),
                _optionWidget( 'Lista de Accesiones', () => Navigator.pushNamed(context, 'accession' )  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionWidget(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 200,
        child: Center(
            child: Text( title,
              style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),
              textAlign: TextAlign.center,
            )
        ),
        decoration: BoxDecoration(
            color: ColorStyles.accentColor,
            borderRadius: BorderRadius.all( Radius.circular(10) )
        ),
      ),
    );
  }
}
