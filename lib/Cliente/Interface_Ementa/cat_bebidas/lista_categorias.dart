import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sumos_aguas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/cat_bebidas/profile_menu.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/cat_bebidas/profilepic.dart';
import '../subcategorias/cafes/homepage.dart';

class cat_bebidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black,
        size: 30),
      ),
      body: SingleChildScrollView(
      child:   Column(
          children: [
            ProfilePic(),
          SizedBox(height: 20),
          Text("My Coffee",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontFamily: 'Varela'
            ),),
          SizedBox(height: 10),
          Text("Bebidas - Sub-Categorias",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Varela',
              color: Colors.orange,
            ),),
          SizedBox(height: 40),
          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          ProfileMenu(
            text: "Bebidas Alcoólicas",
            icon: "assets/Icons/bebalcool.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_bebalcool(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Cafés",
            icon: "assets/Icons/cafeicon.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_cafes(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Sumos - Águas",
            icon: "assets/Icons/bebidas.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepagesumos_aguas(),
                ),
              );
            },
          ),
        ],
      ),
      ),
    );
  }
}
