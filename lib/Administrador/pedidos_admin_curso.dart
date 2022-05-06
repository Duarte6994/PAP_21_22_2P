// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Cliente/Interface_Ementa/estilos/colors.dart';
import '../Cliente/Interface_Ementa/estilos/style.dart';

class pedidos_admin_espera extends StatefulWidget {
  const pedidos_admin_espera({Key? key}) : super(key: key);

  @override
  _pedidos_admin_esperaState createState() => _pedidos_admin_esperaState();
}

class _pedidos_admin_esperaState extends State<pedidos_admin_espera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/images/menu.svg'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 135),
                      child: PrimaryText(
                        text: 'My Coffee',
                        size: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 105),
                      child: PrimaryText(
                        text: '| Pedidos em Curso |',
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}