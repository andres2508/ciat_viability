import 'package:flutter/material.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/home/appbar.widget.dart';
import 'package:gg_viability/ui/home/drawer.menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CIATAppBarWidget(
        title: 'Cultivo para evaluar',
      ),
      drawer: Drawer(
        child: CIATMenuWidget(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Seleccione el cultivo a evaluar',
              style: TextStyle(color: ColorStyles.accentColor, fontSize: 26),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _optionWidget('Frijol'.toUpperCase(),
                    () => Navigator.pushNamed(context, 'beans/pending')),
                SizedBox(width: 30),
                _optionWidget('Forrajes'.toUpperCase(),
                    () => Navigator.pushNamed(context, 'forage/pendings')),
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
        )),
        decoration: BoxDecoration(
            color: ColorStyles.darkColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
